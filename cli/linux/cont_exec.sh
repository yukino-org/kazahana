#!/bin/bash

set -eu

self=$(readlink -f "$0")
here=${self%/*}
root_dir=$(realpath "${here}/../..")

image_name="kazahana-dev/ubuntu"
cont_name="kazahana-debug-run"

host_kazahana_dir="${root_dir}"
host_cont_cache_dir="${root_dir}/.cont-cache"
host_cont_dart_cache_global_dir="${host_cont_cache_dir}/.dart-cache_global"
host_cont_dart_tool_global_dir="${host_cont_cache_dir}/.dart-tool_global"
host_cont_flutter_global_file="${host_cont_cache_dir}/.flutter_global"
host_cont_flutter_cache_global_dir="${host_cont_cache_dir}/.flutter-cache_global"
host_cont_pub_cache_global_dir="${host_cont_cache_dir}/.pub-cache_global"
host_cont_dart_tool_local_dir="${host_cont_cache_dir}/.dart_tool_local"
host_cont_pub_cache_local_dir="${host_cont_cache_dir}/.pub-cache_local"

if ! [[ -d "${host_cont_cache_dir}" ]]; then
    mkdir "${host_cont_cache_dir}"
    mkdir "${host_cont_dart_cache_global_dir}"
    mkdir "${host_cont_dart_tool_global_dir}"
    touch "${host_cont_flutter_global_file}"
    mkdir "${host_cont_flutter_cache_global_dir}"
    mkdir "${host_cont_pub_cache_global_dir}"
    mkdir "${host_cont_dart_tool_local_dir}"
    mkdir "${host_cont_pub_cache_local_dir}"
fi

cont_home_dir="/home/dev"
cont_kazahana_dir="${cont_home_dir}/kazahana"
cont_dart_cache_global_dir="${cont_home_dir}/.dart"
cont_dart_tool_global_dir="${cont_home_dir}/.dart-tool"
cont_flutter_global_file="${cont_home_dir}/.flutter"
cont_flutter_cache_global_dir="${cont_home_dir}/flutter/bin/cache"
cont_pub_cache_global_dir="${cont_home_dir}/.pub-cache"
cont_dart_tool_local_dir="${cont_kazahana_dir}/.dart_tool"
cont_pub_cache_local_dir="${cont_kazahana_dir}/.pub-cache"

cont_flags=()
attach_display="${X_ATTACH_DISPLAY:=0}"

if [[ "${attach_display}" == "1" ]]; then
    host_x11_sock="/tmp/.X11-unix"
    host_xauthority="$XAUTHORITY"
    cont_xdg_runtime_dir="$XDG_RUNTIME_DIR"
    host_wayland="${cont_xdg_runtime_dir}/$WAYLAND_DISPLAY"
    host_dbus_session_bus="${cont_xdg_runtime_dir}/bus"
    host_dbus_session_ats_bus="${cont_xdg_runtime_dir}/at-spi/bus"

    cont_x11_sock="/tmp/.X11-unix"
    cont_xauthority="${cont_home_dir}/.Xauthority"
    cont_xdg_runtime_dir="/run/user/$(id -u)"
    cont_wayland="${cont_xdg_runtime_dir}/$WAYLAND_DISPLAY"
    cont_dbus_session_bus="${cont_xdg_runtime_dir}/bus"
    cont_dbus_session_ats_bus="${cont_xdg_runtime_dir}/at-spi/bus"

    cont_flags=("${cont_flags[@]}"
        -v "${host_x11_sock}:${cont_x11_sock}:ro"
        -v "${host_xauthority}:${cont_xauthority}:ro"
        -v "${host_wayland}:${cont_wayland}:ro"
        -v "${host_dbus_session_bus}:${cont_dbus_session_bus}:ro"
        -v "${host_dbus_session_ats_bus}:${cont_dbus_session_ats_bus}:ro"
        -e DISPLAY
        -e WAYLAND_DISPLAY
        -e "XAUTHORITY=${cont_xauthority}"
        -e "XDG_RUNTIME_DIR=${cont_xdg_runtime_dir}"
        -e "DBUS_SESSION_BUS_ADDRESS=unix:path=${cont_dbus_session_bus}"
        --network host
        --security-opt label=type:container_runtime_t)
fi

podman run --rm -it \
    --userns keep-id \
    --no-hosts \
    --name "${cont_name}" \
    -v "${host_kazahana_dir}:${cont_kazahana_dir}:z" \
    -v "${host_cont_cache_dir}" \
    -v "${host_cont_dart_cache_global_dir}:${cont_dart_cache_global_dir}:z" \
    -v "${host_cont_dart_tool_global_dir}:${cont_dart_tool_global_dir}:z" \
    -v "${host_cont_flutter_global_file}:${cont_flutter_global_file}:z" \
    -v "${host_cont_flutter_cache_global_dir}:${cont_flutter_cache_global_dir}:z" \
    -v "${host_cont_pub_cache_global_dir}:${cont_pub_cache_global_dir}:z" \
    -v "${host_cont_dart_tool_local_dir}:${cont_dart_tool_local_dir}:z" \
    -v "${host_cont_pub_cache_local_dir}:${cont_pub_cache_local_dir}:z" \
    -w "${cont_kazahana_dir}" \
    "${cont_flags[@]}" \
    "${image_name}" "$@"
