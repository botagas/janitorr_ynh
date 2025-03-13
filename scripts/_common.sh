#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# App name
app=janitorr

# Leaving Soon directories
leaving_soon_dir="/home/yunohost.multimedia/share/leavingsoon"
media_server_leaving_soon_dir="/home/yunohost.multimedia/share/leavingsoon"

#=================================================
# FETCH INFO AND SET PLACEHOLDERS
#=================================================
ynh_print_info "Setting up variables..."

# Ensure all variables are initialized with user-provided values. This is to ensure Janitorr runs, because even if a service is set to false, it checks for empty variables.
radarr_port="${radarr_port1:1234}"
radarr_url="${radarr_url1:http://example.tld}"
radarr_api_key="${radarr_api_key1:examplestring}"

bazarr_port="${bazarr_port1:1234}"
bazarr_url="${bazarr_url1:http://example.tld}"
bazarr_api_key="${bazarr_api_key1:examplestring}"

sonarr_port="${sonarr_port1:1234}"
sonarr_url="${sonarr_url1:http://example.tld}"
sonarr_api_key="${sonarr_api_key1:examplestring}"

jellystat_port="${jellystat_port1:1234}"
jellystat_url="${jellystat_url1:http://example.tld}"
jellystat_api_key="${jellystat_api_key1:examplestring}"

jellyfin_port="${jellyfin_port1:1234}"
jellyfin_url="${jellyfin_url1:http://example.tld}"
jellyfin_username="${jellyfin_username1:Janitorr}"
jellyfin_password="${jellyfin_password1:Janitorr}"

jellyseerr_port="${jellyseerr_port1:1234}"
jellyseerr_url="${jellyseerr_url1:http://example.tld}"
jellyseerr_api_key="${jellyseerr_api_key1:examplestring}"
jellyfin_api_key="${jellyfin_api_key1:examplestring}"

# Find service API keys and ports
if ls /etc/yunohost/apps | grep -q "radarr"; then
        radarr_port=$(ynh_app_setting_get --app radarr --key port)
        radarr_url="http://127.0.0.1:$radarr_port"
        radarr_api_key=$(ynh_app_setting_get --app radarr --key api_key)
else
        ynh_print_warn "Couldn't find Radarr port and api_key..."
fi
if ls /etc/yunohost/apps | grep -q "bazarr"; then
        bazarr_port=$(ynh_app_setting_get --app bazarr --key port)
        bazarr_url="http://127.0.0.1:$bazarr_port"
        bazarr_api_key=$(ynh_app_setting_get --app bazarr --key api_key)
else
        ynh_print_warn "Couldn't find Badarr port and api_key..."
fi
if ls /etc/yunohost/apps | grep -q "sonarr"; then
        sonarr_port=$(ynh_app_setting_get --app sonarr --key port)
        sonarr_url="http://127.0.0.1:$sonarr_port"
        sonarr_api_key=$(ynh_app_setting_get --app sonarr --key api_key)
else
        ynh_print_warn "Couldn't find Sonarr port and api_key..."
fi
if ls /etc/yunohost/apps | grep -q "jellystat"; then
        jellystat_port=$(ynh_app_setting_get --app jellystat --key port)
        jellystat_url="http://127.0.0.1:$jellystat_port"
        jellystat_api_key=$(ynh_app_setting_get --app jellystat --key api_key)
else
        ynh_print_warn "Couldn't find Jellystat port and api_key..."
fi
if ls /etc/yunohost/apps | grep -q "jellyfin"; then
        jellyfin_port=$(ynh_app_setting_get --app jellyfin --key port)
        jellyfin_url="http://127.0.0.1:$jellyfin_port"
else
        ynh_print_warn "Couldn't find Jellyfin port and api_key..."
fi
if ls /etc/yunohost/apps | grep -q "jellyseerr"; then
        jellyseerr_port=$(ynh_app_setting_get --app jellyseerr --key port)
        jellyseerr_url="http://127.0.0.1:$jellyseerr_port"
        jellyseerr_api_key=$(ynh_app_setting_get --app jellyseerr --key api_key)
        jellyfin_api_key=$(ynh_hide_warnings curl --silent --show-error --fail -X GET http://127.0.0.1:$jellyseerr_port/api/v1/settings/jellyfin -H "accept: application/json" -H "X-Api-Key: $jellyseerr_api_key" | jq -r '.apiKey')

else
        ynh_print_warn "Couldn't find Jellyseerr port and api_key..."
fi
