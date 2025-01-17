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
# COMMON FUNCTIONS
#=================================================
ynh_use_java() {
    java_version=$(ynh_app_setting_get --app=$app --key=java_version)

    #get the architecture: amd or arm ?
    ynh_get_architecture

    # Get the absolute path of this version of Java
    java_path="/usr/lib/jvm/java-$java_version-openjdk-$ynh_architecture/bin"

    # Allow alias to be used into bash script
    shopt -s expand_aliases

    # Create an alias for the specific version of node and a variable as fallback
    ynh_java="$java_path/java"
    alias ynh_java="$ynh_java"

    # Load the path of this version of Java in $PATH
    if [[ :$PATH: != *":$java_path"* ]]; then
        PATH="$java_path:$PATH"
    fi
    java_PATH="$PATH"
    # Create an alias to easily load the PATH
    ynh_java_load_PATH="PATH=$java_PATH"
    # Same var but in lower case to be compatible with ynh_replace_vars...
    ynh_java_load_path="PATH=$java_PATH"
}
ynh_install_java() {
    # Use debian packages to install the requested Java version

    # Declare an array to define the options of this helper.
    local legacy_args=jte
    local -A args_array=([j]=java_version= [t]=jdk_type= [e]=java_engine)
    local java_version
    local jdk_type
    local java_engine
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    java_version="${java_version:-17}"
    jdk_type="${jdk_type:-jre}"
    java_engine="${java_engine:-}"

    package_name=openjdk-${java_version}-${jdk_type}
    if [ -n "$java_engine" ]; then
      package_name=${package_name}-${java_engine}
    fi

    ynh_apt_install_dependencies ${package_name}

    # Store java_version into the config of this app
    ynh_app_setting_set --app=$app --key=java_version --value=$java_version
    ynh_app_setting_set --app=$app --key=jdk_type --value=$jdk_type
    ynh_app_setting_set --app=$app --key=java_engine --value=$java_engine

    ynh_use_java
}
ynh_remove_java () {
    local java_version=$(ynh_app_setting_get --app=$YNH_APP_INSTANCE_NAME --key=java_version)

    # Remove the lines for this app
    ynh_app_setting_delete --app=$YNH_APP_INSTANCE_NAME --key=java_version
    ynh_app_setting_delete --app=$YNH_APP_INSTANCE_NAME --key=jdk_type
    ynh_app_setting_delete --app=$YNH_APP_INSTANCE_NAME --key=java_engine

}
ynh_get_architecture() {
      uname=$(uname --machine)
      if [[ $uname =~ aarch64 || $uname =~ arm64 ]]; then
          ynh_architecture="arm64"
      else
          ynh_architecture="amd64"
      fi

}

# Add common reusable functions here if needed
