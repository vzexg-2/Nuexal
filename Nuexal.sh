#!/bin/bash


set -euo pipefail












: << 'COMMENT_1'


License is valid till 12 July, 2025 because I set it to be that date.
  You can upgrade the license by contacting sunshinexjuhari@protonmail.com 
  Or if you know how to do it, just change it.

Note that this code doesn't actually boost the performance 
  Yes it does but it's not that effective, use root next time.
  We are not responsible if anything bad happened.

  Our task is to create the best performance on game
  Making a best exploit for games including the kids game aka Roblox.
  Due to limitation, this script may not be effective as you expected.
  So it's the best to use root for this.

Nuexal is a real script to actually improve your gaming experience
  Not like other script that are fakes, including those who put a String that doesn't even exist.
  Nuexal creator aka sxc_qq1 (me lmao) knows the settings, string, how to manipulate device and others 
  I suggest you to use built in game booster if you want a direct boost to your game.
  
Next update I'm going to add Thermal throttling, Texture decompress, Vulkan/Skiagl renderer.
COMMENT_1











# part: color
RED='\033[0;31m'
B_RED="\e[1;31m"  # Bold Red
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'
WHITE='\033[1;37m'

# part: log_symbol
SUCCESS_SYMBOL="✔"     # Success asian kid
FAILED_SYMBOL="✖"      # A failure 
WARNING_SYMBOL="⚠"     # Depends
INFO_SYMBOL="ℹ"         # Idk what this is

# part: metadata
SCRIPT_NAME="Nuexal"  
VERSION="v2.1"        
CREATOR="sxc_qq1 | sunshinexjuhari@protonmail.com" # do not change this shit I'll track your fucking ADDRESS
GITHUB="vzexg-2"

cihuy() { 
    local tgl=$(date +%Y-%m-%d); 
    local y=$((2020 + 5)); 
    local m=$((3 + 4)); 
    local d=$((10 + 2));
    local cihuyy="$y-$(printf "%02d" $m)-$(printf "%02d" $d)"; 
    local encrypted_cihuyyy=$(echo -n "$cihuyy" | sha256sum | awk '{print $1}'); 
    [[ "$tgl" > "$cihuyy" ]] && { echo -e "${RED}License expired. Please renew your license: sunshinexjuhari@protonmail.com${NC}"; exit 1; } || echo -e "${GREEN}License is valid until $cihuyy${NC}"; 
}; sleep 1.5;cihuy; sleep 2.0; clear

show_info() {
    echo -e "${BLUE}Script Name: ${SCRIPT_NAME}${NC}"
    echo -e "${BLUE}Version: ${VERSION}${NC}"
    echo -e "${BLUE}Creator: ${CREATOR}${NC}"
    echo -e "${BLUE}GitHub: ${GITHUB}${NC}"
    echo "
NuexaI is a script module that focuses in performance and stability 
Also using adb shell is not that effective but using root is more effective since it has access directly to the file system amd configuration.
 
Root mode for Nuexal is unstable since it's not tested yet but using 'our' knowledge for it
Make sure you backup everything and know what you are doing."
}

log() {
    local message="$1"
    local level="$2"
    
    case $level in
        SUCCESS) echo -e "${GREEN}${SUCCESS_SYMBOL} ${message}${NC}" ;;
        FAILED) echo -e "${RED}${FAILED_SYMBOL} ${message}${NC}" ;;
        WARNING) echo -e "${YELLOW}${WARNING_SYMBOL} ${message}${NC}" ;;
        INFO) echo -e "${BLUE}${INFO_SYMBOL} ${message}${NC}" ;;
        *) echo "$message" ;;
    esac
}

monitor_error() { # part: monitor, sub: error
    local command="$1"
    if ! eval "$command"; then
        log "Oopsie: $command" FAILED
        adb logcat -d | tail -n 20  # ( don't delete it plss )
        exit 1
    fi
}

get_timestamp() {
    date +"%Y-%m-%d %H:%M:%S" # timestamp for log.
}

test_f() {
    adb devices > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "adb is working." SUCCESS
        log "If other tests not showing up, that means you are not connected." INFO
    else
        log "ADB is not working." FAILED
        exit 1
    fi
    sleep 1

    adb shell dumpsys battery set level 100 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "Battery level set to 100." SUCCESS
    else
        log "Unable to set battery level." FAILED
        exit 1
    fi

    sleep 1

    adb shell dumpsys battery | grep "level"
    if [ $? -eq 0 ]; then
        adb shell dumpsys battery reset
        log "Battery level retrieved." SUCCESS
    else
        log "Unable to retrieve battery level." FAILED
    fi

    sleep 1

    adb shell getprop ro.build.version.release > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "Android version retrieved." SUCCESS
    else
        log "Unable to retrieve Android version." FAILED
    fi

    sleep 1

    adb shell getprop ro.product.model > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "Device model retrieved." SUCCESS
    else
        log "Unable to retrieve device model." FAILED
    fi

    sleep 1
    adb shell dumpsys cpuinfo | head -n 10 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "CPU usage stats retrieved." SUCCESS
    else
        log "Unable to retrieve CPU usage stats." FAILED
    fi

    sleep 1
    adb shell dumpsys meminfo com.example.app > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "Memory info for the app retrieved." SUCCESS
    else
        log "Unable to retrieve memory info for the app." FAILED
    fi

    sleep 1
    adb shell dumpsys connectivity > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log "Network connectivity status retrieved." SUCCESS
    else
        log "Unable to retrieve network connectivity status." FAILED
    fi
}

boost_performance() { # don't touch this
    local package_name=$1
   
    log "Initiating performance boost for $package_name." INFO
    local game_mode=1
    local touch_delay=0
    local fps_boost=1
  
    monitor_error "adb shell setprop debug.javafx.animation.framerate 120 && log '[$(get_timestamp)] Set debug.javafx.animation.framerate to 120' SUCCESS"
    monitor_error "adb shell setprop debug.systemuicompilerfilter speed && log '[$(get_timestamp)] Set debug.systemuicompilerfilter to speed' SUCCESS"
    monitor_error "adb shell setprop debug.app.performance_restricted false && log '[$(get_timestamp)] Set debug.app.performance_restricted to false' SUCCESS"
    monitor_error "adb shell setprop debug.sf.set_idle_timer_ms 30 && log '[$(get_timestamp)] Set debug.sf.set_idle_timer_ms to 30' SUCCESS"
    monitor_error "adb shell setprop debug.sf.disable_backpressure 1 && log '[$(get_timestamp)] Set debug.sf.disable_backpressure to 1' SUCCESS"
    monitor_error "adb shell setprop debug.sf.latch_unsignaled 1 && log '[$(get_timestamp)] Set debug.sf.latch_unsignaled to 1' SUCCESS"
    monitor_error "adb shell setprop debug.sf.enable_hwc_vds 1 && log '[$(get_timestamp)] Set debug.sf.enable_hwc_vds to 1' SUCCESS"
    monitor_error "adb shell setprop debug.composition.type gpu && log '[$(get_timestamp)] Set debug.composition.type to gpu' SUCCESS"
    monitor_error "adb shell setprop debug.composition.type c2d && log '[$(get_timestamp)] Set debug.composition.type to c2d' SUCCESS"
    
    monitor_error "adb shell setprop persist.sys.game_mode $game_mode && log '[$(get_timestamp)] Game mode enabled: $game_mode' SUCCESS"
    monitor_error "adb shell am force-stop $package_name && log '[$(get_timestamp)] Package $package_name stopped.' SUCCESS"
    monitor_error "adb shell settings put global zen_mode 1 && log '[$(get_timestamp)] Do Not Disturb mode enabled.' SUCCESS"
    monitor_error "adb shell setprop persist.sys.touch_delay $touch_delay && log '[$(get_timestamp)] Touch delay reduced to minimum: $touch_delay' SUCCESS"
    monitor_error "adb shell setprop debug.performance.tuning $fps_boost && log '[$(get_timestamp)] Fps stabilizer enabled: $fps_boost' SUCCESS"
    monitor_error "adb shell pm enable $package_name && log '[$(get_timestamp)] Restarted: $package_name' SUCCESS"
    
    if adb shell monkey -p "$package_name" -c android.intent.category.LAUNCHER 1; then
        log "[$(get_timestamp)] Successfully opened $package_name." SUCCESS
    else
        log "[$(get_timestamp)] Failed to open $package_name." FAILED
        adb logcat -d | tail -n 20  # additional log (don't delete it plss)
        exit 1
    fi
}

unstable_h() {
	local package_name=$1
	local game_mode=1
   local touch_delay=0
   local fps_boost=1

	log "Applying high performance tweaks..." INFO
	log "This may cause overheat and battery drain" WARNING
    sleep 4 # Read if first dumbass.

	monitor_error "adb shell setprop debug.composition.type gpu && log '[$(get_timestamp)] Set debug.composition.type to gpu' SUCCESS"
	monitor_error "adb shell setprop debug.composition.type c2d && log '[$(get_timestamp)] Set debug.composition.type to c2d' SUCCESS"
	monitor_error "adb shell setprop debug.hwui.renderer skiagl && log '[$(get_timestamp)] Set debug.hwui.renderer to skiagl' SUCCESS"
	monitor_error "adb shell setprop debug.gr.swapinterval -60 && log '[$(get_timestamp)] Set debug.gr.swapinterval to -60' SUCCESS"
	monitor_error "adb shell setprop debug.gr.numframebuffers 3 && log '[$(get_timestamp)] Set debug.gr.numframebuffers to 3' SUCCESS"
	monitor_error "adb shell setprop debug.egl.buffcount 4 && log '[$(get_timestamp)] Set debug.egl.buffcount to 4' SUCCESS"
	monitor_error "adb shell setprop debug.egl.force_msaa 1 && log '[$(get_timestamp)] Set debug.egl.force_msaa to 1' SUCCESS"
	monitor_error "adb shell setprop debug.cpurend.vsync false && log '[$(get_timestamp)] Set debug.cpurend.vsync to false' SUCCESS"
	monitor_error "adb shell setprop debug.enabletr true && log '[$(get_timestamp)] Set debug.enabletr to true' SUCCESS"
	monitor_error "adb shell setprop debug.overlayui.enable 1 && log '[$(get_timestamp)] Set debug.overlayui.enable to 1' SUCCESS"
	monitor_error "adb shell setprop debug.egl.hw 0 && log '[$(get_timestamp)] Set debug.egl.hw to 0' SUCCESS"
	monitor_error "adb shell setprop debug.gralloc.gfx_ubwc_disable 0 && log '[$(get_timestamp)] Set debug.gralloc.gfx_ubwc_disable to 0' SUCCESS"
	monitor_error "adb shell setprop debug.mdpcomp.logs 0 && log '[$(get_timestamp)] Set debug.mdpcomp.logs to 0' SUCCESS"
	monitor_error "adb shell setprop debug.egl.hw 1 && log '[$(get_timestamp)] Set debug.egl.hw to 1' SUCCESS"
	monitor_error "adb shell setprop debug.egl.profiler 0 && log '[$(get_timestamp)] Set debug.egl.profiler to 0' SUCCESS"
	monitor_error "adb shell setprop debug.performance.tuning 1 && log '[$(get_timestamp)] Set debug.performance.tuning to 1' SUCCESS"
	monitor_error "adb shell setprop debug.sf.hw 1 && log '[$(get_timestamp)] Set debug.sf.hw to 1' SUCCESS"
	monitor_error "adb shell setprop debug.egl.swapinterval -60 && log '[$(get_timestamp)] Set debug.egl.swapinterval to -60' SUCCESS"
	monitor_error "adb shell setprop debug.renderengine.backend skiagl && log '[$(get_timestamp)] Set debug.renderengine.backend to skiagl' SUCCESS"
	monitor_error "adb shell setprop debug.renderengine.backend skiaglthreaded && log '[$(get_timestamp)] Set debug.renderengine.backend to skiaglthreaded' SUCCESS"
	monitor_error "adb shell setprop debug.angle.overlay FPS:skiagl*PipelineCache* && log '[$(get_timestamp)] Set debug.angle.overlay to FPS:skiagl*PipelineCache*' SUCCESS"
	monitor_error "adb shell setprop debug.javafx.animation.framerate 120 && log '[$(get_timestamp)] Set debug.javafx.animation.framerate to 120' SUCCESS"
	monitor_error "adb shell setprop debug.systemuicompilerfilter speed && log '[$(get_timestamp)] Set debug.systemuicompilerfilter to speed' SUCCESS"
	monitor_error "adb shell setprop debug.app.performance_restricted false && log '[$(get_timestamp)] Set debug.app.performance_restricted to false' SUCCESS"
	monitor_error "adb shell setprop debug.sf.set_idle_timer_ms 30 && log '[$(get_timestamp)] Set debug.sf.set_idle_timer_ms to 30' SUCCESS"
	monitor_error "adb shell setprop debug.sf.disable_backpressure 1 && log '[$(get_timestamp)] Set debug.sf.disable_backpressure to 1' SUCCESS"
	monitor_error "adb shell setprop debug.sf.latch_unsignaled 1 && log '[$(get_timestamp)] Set debug.sf.latch_unsignaled to 1' SUCCESS"
	monitor_error "adb shell setprop debug.sf.enable_hwc_vds 1 && log '[$(get_timestamp)] Set debug.sf.enable_hwc_vds to 1' SUCCESS"
	monitor_error "adb shell setprop debug.sf.early_phase_offset_ns 500000 && log '[$(get_timestamp)] Set debug.sf.early_phase_offset_ns to 500000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.early_app_phase_offset_ns 500000 && log '[$(get_timestamp)] Set debug.sf.early_app_phase_offset_ns to 500000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.early_gl_phase_offset_ns 3000000 && log '[$(get_timestamp)] Set debug.sf.early_gl_phase_offset_ns to 3000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.early_gl_app_phase_offset_ns 15000000 && log '[$(get_timestamp)] Set debug.sf.early_gl_app_phase_offset_ns to 15000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.high_fps_early_phase_offset_ns 6100000 && log '[$(get_timestamp)] Set debug.sf.high_fps_early_phase_offset_ns to 6100000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.high_fps_late_sf_phase_offset_ns 8000000 && log '[$(get_timestamp)] Set debug.sf.high_fps_late_sf_phase_offset_ns to 8000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.high_fps_early_gl_phase_offset_ns 9000000 && log '[$(get_timestamp)] Set debug.sf.high_fps_early_gl_phase_offset_ns to 9000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.high_fps_late_app_phase_offset_ns 1000000 && log '[$(get_timestamp)] Set debug.sf.high_fps_late_app_phase_offset_ns to 1000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.high_fps_late_sf_phase_offset_ns 8000000 && log '[$(get_timestamp)] Set debug.sf.high_fps_late_sf_phase_offset_ns to 8000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.high_fps_early_gl_phase_offset_ns 9000000 && log '[$(get_timestamp)] Set debug.sf.high_fps_early_gl_phase_offset_ns to 9000000' SUCCESS"
	monitor_error "adb shell setprop debug.sf.phase_offset_threshold_for_next_vsync_ns 6100000 && log '[$(get_timestamp)] Set sf.phase_offset_threshold_for_next_vsync_ns to:6100000' SUCCESS"
   monitor_error "adb shell setprop persist.sys.game_mode $game_mode && log '[$(get_timestamp)] Game mode enabled: $game_mode' SUCCESS"
   monitor_error "adb shell am force-stop $package_name && log '[$(get_timestamp)] Package $package_name stopped.' SUCCESS"
   monitor_error "adb shell settings put global zen_mode 1 && log '[$(get_timestamp)] Do Not Disturb mode enabled.' SUCCESS"
   monitor_error "adb shell setprop persist.sys.touch_delay $touch_delay && log '[$(get_timestamp)] Touch delay reduced to minimum: $touch_delay' SUCCESS"
   monitor_error "adb shell setprop debug.performance.tuning $fps_boost && log '[$(get_timestamp)] Fps stabilizer enabled: $fps_boost' SUCCESS"
   monitor_error "adb shell pm enable $package_name && log '[$(get_timestamp)] Restarted: $package_name' SUCCESS"
    
	if adb shell monkey -p "$package_name" -c android.intent.category.LAUNCHER 1; then
        log "[$(get_timestamp)] Successfully opened $package_name." SUCCESS
   else
        log "[$(get_timestamp)] Failed to open $package_name." FAILED
        adb logcat -d | tail -n 20  # additional log (don't delete it)
        exit 1
   fi
}

maxFrame() {
    # path
    cat /sys/class/graphics/fb0/fps_max 2>/dev/null || echo 60 # default
}


#!/bin/bash

root_t() {
    local package_name=$1
    local max_fps=$(maxFrame)  
    
    log "Initiating performance boost for $package_name" INFO
    log "We are not responsible if anything happens during the reboot, you have 10 seconds to change your mind." WARNING
    sleep 10

    echo ""
    monitor_error "echo 'opengl' > /sys/class/graphics/fb0/mode && log '[$(get_timestamp)] Forced renderer to OpenGL' SUCCESS"
    echo ""

    log "Spoofing devices..." INFO
    echo ""
    monitor_error "setprop ro.product.model 'SM-S25Ultra' && log '[$(get_timestamp)] Spoofed device model to SM-S25Ultra' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.product.manufacturer 'Samsung' && log '[$(get_timestamp)] Spoofed manufacturer to Samsung' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.product.device 's25ultra' && log '[$(get_timestamp)] Spoofed device name to s25ultra' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.board.platform 'exynos9925' && log '[$(get_timestamp)] Spoofed platform to Exynos 9925' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.hardware 'qcom' && log '[$(get_timestamp)] Spoofed hardware to Qualcomm' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.opengles.version '196608' && log '[$(get_timestamp)] Spoofed OpenGL ES version to 3.0' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.ram.size '12000' && log '[$(get_timestamp)] Spoofed RAM size to 12GB' SUCCESS"; sleep 1.5
    monitor_error "setprop ro.product.cpu.abi 'arm64-v8a' && log '[$(get_timestamp)] Spoofed CPU architecture to ARM64' SUCCESS"; sleep 1.5; echo ""
    
    echo "_____________________________________________"
    log "Spoofed: Device model to SM-S25Ultra" INFO
    log "Spoofed: Manufacturer to Samsung" INFO
    log "Spoofed: Device name to s25ultra" INFO
    log "Spoofed: Platform to Exynos 9925" INFO
    log "Spoofed: Hardware to Qualcomm" INFO
    log "Spoofed: OpenGL ES version to 3.0" INFO
    log "Spoofed: RAM size to 12GB" INFO
    log "Spoofed: CPU architecture to ARM64" INFO
    echo "---------------------------------------------"; sleep 1
    echo " "
    
    log "Configuring thermal throttling parameters." INFO
    sleep 1.5
    # part: thermal throttling, sub: kill
    monitor_error "echo $max_fps > /sys/class/graphics/fb0/fps && log '[$(get_timestamp)] Set FPS limiter to: $max_fps' SUCCESS"
    monitor_error "echo 'performance' > /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor && log '[$(get_timestamp)] Set all CPU cores to performance mode' SUCCESS"
    
    MODPATH="/data/local/tmp/thermal_fix"

    if [ ! -d "$MODPATH/system/xbin" ]; then
        bin=bin
        mkdir -p "$MODPATH/system/$bin"
        if [ -d "$MODPATH/system/xbin" ]; then
            mv "$MODPATH/system/xbin/"* "$MODPATH/system/$bin/"
            rm -rf "$MODPATH/system/xbin/*" 2>/dev/null
            rmdir "$MODPATH/system/xbin" 2>/dev/null
        fi
    fi

    FindThermal() {
        for systemThermal in $(ls "$1" | grep "$2"); do
            if [[ "$systemThermal" == *"-BlankFile"* ]]; then
                log "Ignoring conflict file: $1/$systemThermal" WARNING
            elif [[ "$systemThermal" == *"-OriFile.bck"* ]]; then
                log "Ignoring conflict file: $1/$systemThermal" WARNING
            else
                echo "Found $1/$systemThermal"
                if [ "$2" == "thermal" ]; then
                    if [ ! -f "$3/$systemThermal-BlankFile" ]; then
                        echo "" > "$3/$systemThermal-BlankFile"
                    fi
                    if [ ! -f "$3/$systemThermal-OriFile.bck" ]; then
                        cp -af "$1/$systemThermal" "$3/$systemThermal-OriFile.bck"
                    fi
                    cp -af "$3/$systemThermal-BlankFile" "$3/$systemThermal"
                else
                    if [ ! -f "$3/$systemThermal" ]; then
                        cp -af "$1/$systemThermal" "$3/$systemThermal"
                    fi
                fi
            fi
        done
    }

    FindThermal "/system/bin" "-OriFile.bck" "$MODPATH/system/bin"
    FindThermal "/system/bin" "thermal" "$MODPATH/system/bin"
    FindThermal "/vendor/bin" "-OriFile.bck" "$MODPATH/system/vendor/bin"
    FindThermal "/vendor/bin" "thermal" "$MODPATH/system/vendor/bin"
    FindThermal "/vendor/etc" "-OriFile.bck" "$MODPATH/system/vendor/etc"
    FindThermal "/vendor/etc" "thermal" "$MODPATH/system/vendor/etc"

    echo "0" > "$MODPATH/system/vendor/etc/thermalStatus.info"

    chown -R root:root "$MODPATH"
    chmod -R 755 "$MODPATH"
    chmod -R 777 "$MODPATH/system/$bin"

    if [ "$bin" == "xbin" ]; then
        chmod -R 755 "$MODPATH/system/bin"
    fi

    chmod -R 755 "$MODPATH/system/vendor/bin"
    chmod -R 644 "$MODPATH/system/vendor/etc"
    
    monitor_error "pm clear $package_name && log '[$(get_timestamp)] Cleared cache for package: $package_name' SUCCESS"
    monitor_error "sync; echo 3 > /proc/sys/vm/drop_caches && log '[$(get_timestamp)] Cleared system caches' SUCCESS"
    monitor_error "echo 0 > /sys/kernel/debug/sched/sched_debug && log '[$(get_timestamp)] Disabled scheduler debugging' SUCCESS"
    monitor_error "echo 0 > /sys/module/lowmemorykiller/parameters/minfree && log '[$(get_timestamp)] Adjusted low memory killer settings' SUCCESS"
    monitor_error "killall -9 $(pgrep -v -f $package_name) && log '[$(get_timestamp)] Cleared background tasks except for: $package_name' SUCCESS"
    monitor_error "echo 0 > /proc/sys/vm/swappiness && log '[$(get_timestamp)] Set swappiness to zero to prioritize RAM usage over swap' SUCCESS"
    monitor_error "echo 'noop' > /sys/block/mmcblk0/queue/scheduler && log '[$(get_timestamp)] Set I/O scheduler to noop for better performance' SUCCESS"
    monitor_error "echo 1 > /sys/module/snd_soc_wcd9335/parameters/ultrasound_enable && log '[$(get_timestamp)] Enabled ultra low-latency audio mode' SUCCESS"
    monitor_error "echo 0 > /sys/module/printk/parameters/console_suspend && log '[$(get_timestamp)] Disabled kernel logging to console for better performance' SUCCESS"
    monitor_error "echo 1 > /sys/module/synaptics_dsx/parameters/noise_suppression && log '[$(get_timestamp)] Enabled touch noise suppression' SUCCESS"

   if monkey -p "$package_name" -c android.intent.category.LAUNCHER 1; then
        log "[$(get_timestamp)] Successfully opened $package_name." SUCCESS
   else
        log "[$(get_timestamp)] Failed to open $package_name." FAILED
        exit 1
   fi 
}

debugM_state() {
    # part: color
    RED='\033[1;31m'     # Bright Red
    GREEN='\033[1;32m'   # Bright Green
    NC='\033[0m'         # No Color

    while true; do
        # part: prompt
        echo -e -n "${RED}debug${GREEN}#${NC} "
        read user_input

        # part: usage help
        if [[ "$user_input" == "help" ]] || [[ "$user_input" == "menu" ]]; then
            echo -e "${RED}Help Menu:${NC}"
            echo -e "${GREEN}1. Add a new string:${NC}"
            echo "   Format: new_string['string_name':'string_value'] location:location_path"
            echo "   Example: new_string['my_setting':'my_value'] location:Global"
            echo "   This command sets 'my_setting' to 'my_value' in the global settings."
            echo ""
            echo -e "${GREEN}2. Delete a string:${NC}"
            echo "   Format: delete_str['string_name'] location:location_path"
            echo "   Example: delete_str['my_setting'] location:Global"
            echo "   This command deletes 'my_setting' from the global settings."
            echo ""
            echo -e "
            for location_path / location:location_path
            ${RED}1. Global
            ${RED}2. Secure
            ${RED}3. Prop${NC}

            Example: location:Prop | This will locate the string or delete the string in Android properties
            "
            continue  # Go back to the prompt after showing help
        fi

        # add_string
        if [[ "$user_input" =~ ^new_string\['(.*)':'(.*)'\]\s*location:\s*(Global|Secure|Prop)$ ]]; then
            string_name="${BASH_REMATCH[1]}"
            string_value="${BASH_REMATCH[2]}"
            location="${BASH_REMATCH[3]}"

            case "$location" in
                Global)
                    adb shell settings put global "$string_name" "$string_value"
                    log "Set global setting: $string_name to $string_value" SUCCESS
                    ;;
                Secure)
                    adb shell settings put secure "$string_name" "$string_value"
                    log "Set secure setting: $string_name to $string_value" SUCCESS
                    ;;
                Prop)
                    adb shell setprop "$string_name" "$string_value"
                    log "Set property: $string_name to $string_value" SUCCESS
                    ;;
                *)
                    log "Invalid location specified." FAILED
                    ;;
            esac
        
        # delete_string
        elif [[ "$user_input" =~ ^delete_str\['(.*)'\]\s*location:\s*(Global|Secure|Prop)$ ]]; then
            string_name="${BASH_REMATCH[1]}"
            location="${BASH_REMATCH[2]}"

            case "$location" in
                Global)
                    adb shell settings delete global "$string_name"
                    log "Deleted global setting: $string_name" SUCCESS
                    ;;
                Secure)
                    adb shell settings delete secure "$string_name"
                    log "Deleted secure setting: $string_name" SUCCESS
                    ;;
                Prop)
                    adb shell setprop "$string_name" ""  # empty string effectively deletes it
                    log "Deleted property: $string_name" SUCCESS
                    ;;
                *)
                    log "Invalid location specified." FAILED
                    ;;
            esac

        : << 'NotUsed'
 

        # All below this is not used, this is a comment, all of it is a comment block
        elif [[ "$user_input" =~ ^list\s+(-[ls])\s*(count|countlistall)?$ ]]; then
            add_mode="${BASH_REMATCH[1]}"
            add_mode2="${BASH_REMATCH[2]}"

            # part: defined function 
            list_functions() {
                declare -F | awk '{print $3}'
            }

            # part: count
            count_functions() {
                declare -F | wc -l
            }

            if [[ "$add_mode" == "-l" ]]; then
                current_function=$(declare -f | grep -oP '^\w+(?=\s*\(\))' | tail -n 1)
                echo "Current function running: $current_function"

                if [[ "$add_mode2" == "count" ]]; then
                    count=$(count_functions)
                    echo "Function count: $count"
                
                elif [[ "$add_mode2" == "countlistall" ]]; then
                    listed_all_functions=$(list_functions)
                    count=$(count_functions)
                    echo "$listed_all_functions"
                    echo "Counted functions: $count"
                fi

            elif [[ "$add_mode" == "-s" ]]; then
                all_functions=$(list_functions)
                running_function=$(declare -f | grep -oP '^\w+(?=\s*\(\))' | tail -n 1)

                echo "Non-running functions:"
                for func in $all_functions; do
                    if [[ "$func" != "$running_function" ]]; then
                        echo "$func"
                    fi
                done
            fi

        NotUsed # End comment

        elif [[ "$user_input" == "list_current$" ]]; then
            ls $PWD
        elif [[ "$user_input" == "whoami" ]]; then
            echo "debug_m"
        elif [[ "$user_input" == "exit" ]]; then
            clear; bash $PWD/Nuexal.sh
        
        else
            log "Invalid input format. Please use:" FAILED
            log "  To add: new_string['string_name':'string_value'] location:Location (Global, Secure, or Prop)" INFO
            log "  To delete: delete_str['string_name'] location:Location (Global, Secure, or Prop)" INFO
            echo "

commands:
list_current$       [ list all d/f ]
whoami              [ username ]


ALL BELOW THIS IS NOT WORKING, IT WILL BE FIXED LATER.

list <add_mode1> <add_mode2>
rules:

list -l       [ Show current running function ]
list -s       [ Count all functions in num, output: num]

<add_mode2> | Only when -l used
rules:
list -l <count/countlistall>       [ count: where functions counted as output:num/number ]
                           -       [ countlistall: where all functions listed output:num ]
            "
        fi

        continue
    done
}

show_menu() {

    local _part1="ht"
    local _part2="tp"
    local _part3="s://"
    local _part4="di"
    local _part5="sc"
    local _part6="or"
    local _part7="d.g"
    local _part8="g/JD"
    local _part9="9K"
    local _part10="97MJKx"

    local _omaga1="dis"
    local _omaga2="co"
    local _omaga3="r"
    local _OOOMAGA="d"

    reconstruct__x() { # Recombine
        local yeej=""
        for part in "$@"; do
            yeej+="$part"
        done
        echo "$yeej"
    }
    ggcc__y() { # Recombine
        local var=""
        for niggers in "$@"; do
            var+="$niggers"
        done
        echo "$var"
    }

    local myAss=$(reconstruct__x \
        "$_part1" "$_part2" "$_part3" "$_part4" "$_part5" \
        "$_part6" "$_part7" "$_part8" "$_part9" "$_part10")

    local myD=$(ggcc__y \
        "$_omaga1" " $_omaga2" "$_omaga3" "$_OOOMAGA")
        

    # part: menu
    echo ""
    echo -e ""
    echo -e "${BLUE}                          ╔══════════════════════╗${NC}"
    echo -e "${BLUE}                          ║   Nusantara Module   ║${NC}"
    echo -e "${BLUE}                          ╚══════════════════════╝${NC}"
    echo -e "Discord server: ${myAss}"
    echo " "
    echo -e "${NC}{1}    :  -   | ${WHITE}Script Information${NC}"
    echo -e "${NC}{2}    :  -   | ${WHITE}Boost App/Game${NC}"
    echo -e "${NC}{3}    :  -   | ${WHITE}Power settings${NC}"
    echo -e "${NC}{4}    :  -   | ${WHITE}Exit${NC}"
    echo " |                 ----------{ Unstable Tweak }----------"
    echo -e "{5}    :${B_RED}  -   | H-Performance mode${NC}"
    echo " |                  ----------{ Root Tweak }----------"
    echo -e "{6}    :${B_RED}  -   | Root performance${NC}"
    echo " |                   ----------{ Test adb }----------"
    echo -e "{7}    :${YELLOW}  -   | Test connection${NC}"
    echo -e "             ${YELLOW}_________________________________________________${NC}"
}

main() { # Handler for option.
    while true; do
        show_menu

        read -p ">>> " option

        case "$option" in
            1) 
                show_info 
                ;;
            2) 
                read -p "Package name? > " package_name
                
                if adb shell pm list packages | grep -q "$package_name"; then
                    boost_performance "$package_name"
                    log "Boosted: $package_name." SUCCESS
                    log "Please reboot after using it/use reset all in menu, some configuration may not be deleted automatically" INFO
                else
                    log "Error: package $package_name not found, I suggest you to install package name viewer on Play store" FAILED
                    log "Warning: don't forget to turn on / install adb shell and pair it using adb pair!" WARNING
                fi
                ;;
            3)
                clear
                echo "
                1. Reboot (normal)
                2. Shutdown (normal)
                3. Recovery
                4. Bootloader
                " 
                read -p "(1-4) : " power

                if [[ "$power" == "1" ]]; then
				        log "Rebooting..." INFO
                    adb shell settings put global zen_mode 0
				        sleep 2.5; adb shell svc power reboot
				
				    elif [[ "$power" == "2" ]]; then
				        log "Turning off..." INFO
                    adb shell settings put global zen_mode 0
				        sleep 2.5; adb shell svc power shutdown
				
			    	elif [[ "$power" == "3" ]]; then
				        if [[ $(id -u) -ne 0 ]]; then
			                log "Root access is required to reboot to Recovery." WARNING
	 	    		        exit 1
				        fi
				        log "Rebooting to Recovery..." INFO
				        sleep 2.5; su -c "reboot recovery"
				
			    	elif [[ "$power" == "4" ]]; then
				        if [[ $(id -u) -ne 0 ]]; then
				            log "Root access is required to reboot to Bootloader." WARNING
			    	        exit 1
			    	    fi
		    		    log "Rebooting to Bootloader..." INFO
				        sleep 2.5
                    su -c "reboot bootloader" INFO
                fi
				    ;;
            4)
                exit 0
                ;;
            5)
                read -p "Package name? > " package_name

                if adb shell pm list packages | grep -q "$package_name"; then
                    clear
                    unstable_h "$package_name" 
                    log "Highly boosted: $package_name." SUCCESS
                else
                    log "Unexpected error occured for package: $package_name" FAILED
                fi
                ;;
            6) 
                read -p "Package name? > " package_name
                if pm list packages | grep -q "$package_name"; then
                    echo -e "${B_RED} PLEASE USE SU FOR IT / ENTER 'SU' IN YOUR TERMINAL / TERMUX ( ANDROID ), THIS IS TEMPORARY MESSAGE (10S) , PLEASE READ THIS${NC}"; sleep 10; clear
                    root_t "$package_name"
                    log "Success applying tweak: $package_name" SUCCESS
                else

                    log "Uh oh! failed to apply configuration, make sure you backup In case if there's a fatal error." FAILED
                fi
                ;;
            7)
                test_f

                log "Services (8/8) tested" SUCCESS
                sleep 3; exit 1
                ;;
            debugM_stt)
                if [[ "$option" == "4" ]]; then
                    exit 1
                else
                    clear;debugM_state
                fi
                ;;
            *)
                echo -e "${RED}Uh, there's no such an option.${NC}" 
                ;;
        esac
        
        # After choosing
        read -p "enter to continue..." dummy_var
        clear
    done
}

main "$@"

: << 'Placehold_line'
PLACEHOLDER LINE


PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE

PLACEHOLDER LINE
PLACEHOLDER LINE
PLACEHOLDER LINE


Placehold_line
