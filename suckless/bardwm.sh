#!/bin/bash

# Lebar maksimal teks judul sebelum di-scroll
WIDTH=22
OFFSET=0

# Frame animasi visualizer (Equalizer)
EQ_FRAMES=(
    " ▃▅▇"
    "▃▅▇▅"
    "▅▇▅▃"
    "▇▅▃ "
    "▅▃ ▃"
    "▃ ▃▅"
)
TOTAL_EQ_FRAMES=${#EQ_FRAMES[@]}
EQ_IDX=0

# Fungsi konversi detik ke format MM:SS
format_seconds() {
    local total_sec=${1:-0}
    local min=$((total_sec / 60))
    local sec=$((total_sec % 60))
    printf "%02d:%02d" "$min" "$sec"
}

# Fungsi animasi teks berjalan (marquee/scrolling)
scroll_text() {
    local text="$1"
    local len=${#text}

    # Jika teks lebih pendek dari batas lebar, tampilkan biasa
    if [ "$len" -le "$WIDTH" ]; then
        echo "$text"
        return
    fi

    # Tambahkan spasi di akhir agar perulangan teks tidak menempel
    local padded_text="$text   $text"
    local pos=$((OFFSET % (len + 3)))
    echo "${padded_text:$pos:$WIDTH}"
}

while true; do
    # Cek status media player
    STATUS=$(playerctl status 2>/dev/null)

    if [ "$STATUS" = "Playing" ]; then
        # 1. Ambil Artis & Judul Media
        TITLE=$(playerctl metadata --format '{{ artist }} - {{ title }}' 2>/dev/null)
        [ -z "$TITLE" ] && TITLE=$(playerctl metadata title 2>/dev/null)
        [ -z "$TITLE" ] && TITLE="Media Playing"

        # 2. Proses Teks Scrolling
        DISPLAY_TITLE=$(scroll_text "$TITLE")
        OFFSET=$((OFFSET + 1))

        # 3. Proses Frame Animasi Visualizer
        VISUALIZER="${EQ_FRAMES[$EQ_IDX]}"
        EQ_IDX=$(( (EQ_IDX + 1) % TOTAL_EQ_FRAMES ))

        # 4. Hitung Durasi (Posisi Saat Ini & Total Panjang Media)
        POS_SEC=$(playerctl position 2>/dev/null | cut -d'.' -f1)
        [ -z "$POS_SEC" ] && POS_SEC=0

        LEN_US=$(playerctl metadata mpris:length 2>/dev/null)
        if [ -n "$LEN_US" ] && [ "$LEN_US" -gt 0 ] 2>/dev/null; then
            LEN_SEC=$((LEN_US / 1000000))
            DUR_STR="$(format_seconds "$POS_SEC") / $(format_seconds "$LEN_SEC")"
        else
            DUR_STR="$(format_seconds "$POS_SEC")"
        fi

        # 5. Set teks ke dwm bar (Visualizer + Title + Duration)
        xsetroot -name "$VISUALIZER $DISPLAY_TITLE [$DUR_STR]"

        # Interval 0.2 detik agar animasi visualizer dan scroll terasa mulus
        sleep 0.2

    else
        # Jika media sedang Paused / Stopped / Tidak Ada Player
        OFFSET=0 # Reset offset animasi scroll
        EQ_IDX=0 # Reset index visualizer

        # Tampilkan Jam & Tanggal
        CLOCK=$(date '+%a, %d %b %Y | %H:%M:%S')
        VOL=$(pamixer --get-volume)%
        xsetroot -name " $CLOCK | VOL: $VOL"

        # Refresh santai (1 detik) hemat CPU saat tidak ada media
        sleep 1
    fi
done
