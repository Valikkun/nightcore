rate=30
folder="newNightcore$rate"
rm -rf "$folder"
mkdir "$folder"
for filename in *.mp3; do 
 basePath=${filename%.*}
 artist="Nightcore ($(cut -d'-' -f1 <<< $basePath)"
 artist="${artist%% }"
 title="$(cut -d'-' -f2 <<< $basePath)"
 format=".mp3" 
 modify=" (nightcore)"
 output="$folder/$basePath$modify$format"
 ffmpeg -i "$filename" -metadata title="$title" -metadata artist="$artist)" -filter:a "asetrate=44100*1.$rate" -b:a 320k "$output"
done