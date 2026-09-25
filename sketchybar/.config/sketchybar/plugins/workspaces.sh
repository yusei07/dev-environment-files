#!/usr/bin/env bash

# Every workspace bound to a key in aerospace.toml (e.g. `alt-3 = 'workspace 3'`),
# plus any that currently exist. `aerospace list-workspaces --all` alone only
# returns workspaces that exist right now, which misses empty ones.

workspace_ids() {
  {
    aerospace config --get mode.main.binding --json | jq -r '.[]' | awk '$1 == "workspace" { print $2 }'
    aerospace list-workspaces --all
  } | sort -u
}
