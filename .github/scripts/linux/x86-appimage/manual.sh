#!/bin/bash
set -e
DIR=$(dirname "$0")

read -p "⚙️ Choose mode: Manual (m) or Automatic (a)? (m/a): " MODE
MODE=${MODE,,}  # convert to lowercase

echo "📝 Available steps:"
for script in "$DIR"/0*-*.sh; do
  echo "  - $(basename "$script")"
done
echo

if [[ "$MODE" == "a" ]]; then
  # Automatic mode: run all scripts sequentially without prompting
  for script in "$DIR"/0*-*.sh; do
    STEP_NAME=$(basename "$script")
    echo "🚀 Running $STEP_NAME..."
    if bash "$script"; then
      echo "✅ Completed $STEP_NAME"
    else
      echo "❌ Error in $STEP_NAME"
      exit 1
    fi
    echo
  done
else
  # Manual mode: ask user before running each script
  for script in "$DIR"/0*-*.sh; do
    STEP_NAME=$(basename "$script")

    while true; do
      read -p "▶️ Run $STEP_NAME? (y/N/Q): " CONFIRM
      case "$CONFIRM" in
        [yY])
          echo "🚀 Running $STEP_NAME..."
          if bash "$script"; then
            echo "✅ Completed $STEP_NAME"
          else
            echo "❌ Error in $STEP_NAME"
          fi
          break
          ;;
        [nN]|"")
          echo "⏭️ Skipping $STEP_NAME"
          echo
          break
          ;;
        [qQ])
          echo "🛑 Quitting."
          exit 0
          ;;
        *)
          echo "⚠️ Please answer with y (yes), n (no), or q (quit)."
          ;;
      esac
    done
  done
fi
