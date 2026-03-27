#!/bin/bash

# Use Homebrew Ruby instead of macOS system Ruby 2.6
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

PIDFILE="$(dirname "$0")/.jekyll.pid"
DOCS_DIR="$(dirname "$0")/docs"

start() {
  if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    echo "Already running (PID: $(cat "$PIDFILE"))"
    return
  fi
  echo "Starting Jekyll server..."
  cd "$DOCS_DIR" && bundle exec jekyll serve --livereload > /dev/null 2>&1 &
  echo $! > "$PIDFILE"
  echo "Started (PID: $!)"
}

stop() {
  if [ ! -f "$PIDFILE" ]; then
    echo "Not running (no PID file)"
    return
  fi
  PID=$(cat "$PIDFILE")
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID"
    rm "$PIDFILE"
    echo "Stopped (PID: $PID)"
  else
    echo "Process not found, removing stale PID file"
    rm "$PIDFILE"
  fi
}

status() {
  if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    echo "Running (PID: $(cat "$PIDFILE")) — http://localhost:4000"
  else
    echo "Not running"
  fi
}

case "$1" in
  start)  start ;;
  stop)   stop ;;
  restart) stop; sleep 1; start ;;
  status) status ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac
