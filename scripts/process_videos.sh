#!/usr/bin/env bash
# Prepare forklift-pallet alignment trial videos for public release.
# Usage: process_videos.sh <input_dir> <output_dir>
#   input files:  s{1-9}_{a,b,c}.mp4            (raw top-view recording)
#                 s{1-9}_{a,b,c}_trajectory.mp4 (top-view with tracking overlay)
#   output files: archive/S0n_X.mp4             raw video, audio and metadata removed, video stream copied (no re-encode)
#                 viewing/S0n_X_trajectory.mp4  H.264 re-encode with English scenario label, audio and metadata removed
#                 thumbnails/S0n_X.jpg          middle frame of the viewing version
set -euo pipefail

IN="$1"; OUT="$2"
mkdir -p "$OUT/archive" "$OUT/viewing" "$OUT/thumbnails"
FONT=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf

# scenario -> group, forward distance (m), pallet yaw (deg)
declare -A GROUP=( [1]=Mild [2]=Mild [3]=Mild [4]=Moderate [5]=Moderate [6]=Moderate [7]=Large [8]=Large [9]=Large )
declare -A DFWD=( [1]=3.0 [2]=3.2 [3]=3.5 [4]=3.8 [5]=4.0 [6]=4.2 [7]=4.5 [8]=4.7 [9]=5.0 )
declare -A YAW=( [1]=0 [2]=15 [3]=-30 [4]=30 [5]=-30 [6]=40 [7]=-40 [8]=40 [9]=-40 )

shopt -s nullglob
for f in "$IN"/s[1-9]_[abc].mp4 "$IN"/s[1-9]_[abc]_trajectory.mp4; do
  base=$(basename "$f" .mp4)
  n=${base:1:1}; trial=${base:3:1}; TRIAL=${trial^^}
  id="S0${n}_${TRIAL}"

  if [[ "$base" == *_trajectory ]]; then
    yaw=${YAW[$n]}; yaw_txt=${yaw/-/−}
    label="S0${n} · Trial ${TRIAL} · ${GROUP[$n]}   Pallet ${DFWD[$n]} m ahead, yaw ${yaw_txt}°"
    printf '%s' "$label" > "$OUT/.label_${id}.txt"
    ffmpeg -nostdin -v error -y -i "$f" \
      -vf "fps=30,drawtext=fontfile=${FONT}:textfile=${OUT}/.label_${id}.txt:fontsize=36:fontcolor=white:box=1:boxcolor=black@0.6:boxborderw=14:x=28:y=28" \
      -map 0:v:0 -an -map_metadata -1 -map_metadata:s:v -1 -map_chapters -1 \
      -c:v libx264 -preset veryfast -crf 20 -pix_fmt yuv420p -movflags +faststart \
      "$OUT/viewing/${id}_trajectory.mp4"
    rm -f "$OUT/.label_${id}.txt"
    dur=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$OUT/viewing/${id}_trajectory.mp4")
    mid=$(awk -v d="$dur" 'BEGIN{printf "%.2f", d/2}')
    ffmpeg -nostdin -v error -y -ss "$mid" -i "$OUT/viewing/${id}_trajectory.mp4" -frames:v 1 -vf scale=640:-1 -q:v 3 "$OUT/thumbnails/${id}.jpg"
  else
    ffmpeg -nostdin -v error -y -i "$f" \
      -map 0:v:0 -c:v copy -an -map_metadata -1 -map_metadata:s:v -1 -map_chapters -1 -movflags +faststart \
      "$OUT/archive/${id}.mp4"
  fi
  echo "done: $base -> $id"
done
