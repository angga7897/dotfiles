#!/bin/sh

# Fungsi untuk membuat teks bergulir (scrolling)
scroll_text() {
    text="$1"
    max_len=20
    
    if [ ${#text} -le $max_len ]; then
        echo "$text"
        return
    fi

    # Tambahkan spasi di akhir agar perguliran mulus
    text="$text   "
    len=${#text}
    
    # Ambil detik saat ini untuk menggeser karakter
    pos=$(( $(date +%s) % len ))
    
    substr=$(echo "$text$text" | cut -c $((pos + 1))-$((pos + max_len)))
    echo "$substr"
}

while true; do
    # 1. Cek Status Media via playerctl
    PLAYER_STATUS=$(playerctl status 2>/dev/null)

    if [ "$PLAYER_STATUS" = "Playing" ] || [ "$PLAYER_STATUS" = "Paused" ]; then
        # Ambil Metadata Judul & Artis
        ARTIST=$(playerctl metadata artist 2>/dev/null)
        TITLE=$(playerctl metadata title 2>/dev/null)
        FULL_MEDIA="$ARTIST - $TITLE"

        # Efek Scroll Judul
        SCROLLED_TITLE=$(scroll_text "$FULL_MEDIA")

        # Ambil Posisi & Durasi (Format MM:SS)
        POS_SEC=$(playerctl position 2>/dev/null | cut -d'.' -f1)
        DUR_SEC=$(playerctl metadata mpris:length 2>/dev/null)
        DUR_SEC=$((DUR_SEC / 1000000)) # Konversi microsecond ke second

        if [ -n "$POS_SEC" ] && [ -n "$DUR_SEC" ] && [ "$DUR_SEC" -gt 0 ]; then
            POS_FMT=$(printf '%02d:%02d' $((POS_SEC/60)) $((POS_SEC%60)))
            DUR_FMT=$(printf '%02d:%02d' $((DUR_SEC/60)) $((DUR_SEC%60)))
            TIME_STR="[$POS_FMT/$DUR_FMT]"
        else
            TIME_STR=""
        fi

        ICON="🎵"
        [ "$PLAYER_STATUS" = "Paused" ] && ICON="⏸"
        MEDIA_STR="$ICON $SCROLLED_TITLE $TIME_STR | "
    else
        MEDIA_STR=""
    fi

    # 2. Jam & Tanggal
    CLOCK=$(date '+%A, %d %b %Y | %H:%M')
    VOL=$(pamixer --get-volume-human)
    BRIGHT=$(brightnessctl -m | cut -d',' -f4)
    # Update Status Bar
    xsetroot -name " $MEDIA_STR |  $BRIGHT | 󰓃 $VOL |  $CLOCK |"

    sleep 1
done
