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
# Find service API keys and ports
detect_and_read_radarr_and_sonarr_settings() {
if ls /etc/yunohost/apps | grep -q "radarr"; then
        radarr_port=$(ynh_app_setting_get --app radarr --key port)
        radarr_url="http://127.0.0.1:$radarr_port"
        radarr_api_key=$(ynh_app_setting_get --app radarr --key api_key)
else
        ynh_print_warn "Couldn't find Radarr port and api_key..."
        radarr_port="${radarr_port:-PLACEHOLDER}"
        radar_url="${radarr_url:-http://PLACE.HOLDER}"
        radarr_api_key="${radarr_api_key:-PLACEHOLDER}"
fi
if ls /etc/yunohost/apps | grep -q "bazarr"; then
        bazarr_port=$(ynh_app_setting_get --app bazarr --key port)
        bazarr_url="http://127.0.0.1:$bazarr_port"
        bazarr_api_key=$(ynh_app_setting_get --app bazarr --key api_key)
else
        ynh_print_warn "Couldn't find Badarr port and api_key..."
        bazarr_port="${bazarr_port:-PLACEHOLDER}"
        bazarr_url="${bazarr_url:-http://PLACE.HOLDER}"
        bazarr_api_key="${bazarr_api_key:-PLACEHOLDER}"
fi
if ls /etc/yunohost/apps | grep -q "sonarr"; then
        sonarr_port=$(ynh_app_setting_get --app sonarr --key port)
        sonarr_url="http://127.0.0.1:$sonarr_port"
        sonarr_api_key=$(ynh_app_setting_get --app sonarr --key api_key)
else
        ynh_print_warn "Couldn't find Sonarr port and api_key..."
        sonarr_port="${sonarr_port:-PLACEHOLDER}"
        sonarr_url="${sonarr_url:-http://PLACE.HOLDER}"
        sonarr_api_key="${sonarr_api_key:-PLACEHOLDER}"
fi
if ls /etc/yunohost/apps | grep -q "jellystat"; then
        jellystat_port=$(ynh_app_setting_get --app jellystat --key port)
        jellystat_url="http://127.0.0.1:$jellystat_port"
        jellystat_api_key=$(ynh_app_setting_get --app jellystat --key api_key)
else
        ynh_print_warn "Couldn't find Jellystat port and api_key, setting placeholder values..."
        jellystat_port="${jellystat_port:-PLACEHOLDER}"
        jellystat_url="${jellystat_url:-http://PLACE.HOLDER}"
        jellystat_api_key="${jellystat_api_key:-PLACEHOLDER}"
fi
if ls /etc/yunohost/apps | grep -q "jellyfin"; then
        jellyfin_port=$(ynh_app_setting_get --app jellyfin --key port)
        jellyfin_url="http://127.0.0.1:$jellyfin_port"
else
        ynh_print_warn "Couldn't find Jellyfin port and api_key..."
        jellyfin_port="${jellyfin_port:-PLACEHOLDER}"
        jellyfin_url="${jellyfin_url:-http://PLACE.HOLDER}"
fi
if ls /etc/yunohost/apps | grep -q "jellyseerr"; then
        jellyseerr_port=$(ynh_app_setting_get --app jellyseerr --key port)
        jellyseerr_url="http://127.0.0.1:$jellyseerr_port"
        jellyseerr_api_key=$(ynh_app_setting_get --app jellyseerr --key api_key)
        jellyfin_api_key=$(ynh_hide_warnings curl --silent --show-error --fail -X GET http://127.0.0.1:$jellyseerr_port/api/v1/settings/jellyfin -H "accept: application/json" -H "X-Api-Key: $jellyseerr_api_key" | jq -r '.apiKey')

else
        ynh_print_warn "Couldn't find Jellyseerr port and api_key..."
        jellyseerr_port="${jellyseerr_port:-PLACEHOLDER}"
        jellyseer_url="${jellyseerr_url:-http://PLACE.HOLDER}"
        jellyseerr_api_key="${jellyseerr_api_key:-PLACEHOLDER}"
        jellyfin_api_key="${jellyfin_api_key:-PLACEHOLDER}"
fi
if ls /etc/yunohost/apps | grep -q "streamystats"; then
        streamystats_port=$(ynh_app_setting_get --app streamystats --key port)
        streamystats_url="http://127.0.0.1:$streamystats_port"
        streamystats_api_key=$(ynh_app_setting_get --app streamystats --key api_key)
else
        ynh_print_warn "Couldn't find StreamyStats port and api_key, setting placeholder values..."
        streamystats_port="${streamystats_port:-PLACEHOLDER}"
        streamystats_url="${streamystats_url:-http://PLACE.HOLDER}"
        streamystats_api_key="${streamystats_api_key:-PLACEHOLDER}"
fi
}
