#!/bin/bash
# NAME, temperature,C, Voltage,V, Current,A, watt,w, other
# NAME,            , ,        , ,        , ,     , ,
# NAME,,,,,,,,,


TMP_OUTPUT=$(nvidia-smi -q)
logger `(echo "k-Sensor, " && \
	echo "$TMP_OUTPUT" | grep "Product\ Name"       | cut -d ":" -f 2  && \
	echo "$TMP_OUTPUT" | grep -i GPU\ current\ temp | awk '{print ", " $5 ", " $6 ", , , , , "}' && \
	echo "$TMP_OUTPUT" | grep -i Power\ Draw        | awk '{print ", " $4 ", " $5 }' \
)`
logger `(echo "k-Sensor, " && \
	echo "$TMP_OUTPUT" | grep "Product\ Name"                  | cut -d ":" -f 2  && \
	echo "$TMP_OUTPUT" | grep -i \ \ clocks -A 2               | grep -i Graphics | awk '{print " Clk Graph, " $3 ", " $4 }' \
)`

logger `(echo "k-Sensor, " && \
	echo "$TMP_OUTPUT" | grep "Product\ Name"                  | cut -d ":" -f 2  && \
	echo "$TMP_OUTPUT" | grep -i utilization -A 4              | grep -i Gpu      | awk '{print ",,,,,,,,,,Gpu,        " $3 ", " $4 }' && \
	echo "$TMP_OUTPUT" | grep -i utilization -A 4              | grep -i Memory   | awk '{print ", Mem,  " $3 ", " $4 }' && \
	echo "$TMP_OUTPUT" | grep -i utilization -A 4              | grep -i Encoder  | awk '{print ", Enc, " $3 ", " $4 }' && \
	echo "$TMP_OUTPUT" | grep -i utilization -A 4              | grep -i Decoder  | awk '{print ", Dec, " $3 ", " $4 }' && \
	echo "$TMP_OUTPUT" | grep -i \ \ clocks -A 2               | grep -i Graphics | awk '{print ", Clk Graph, " $3 ", " $4 }' && \
	echo "$TMP_OUTPUT" | grep -i \ \ clocks -A 2               | grep -i SM       | awk '{print ", Clk SM, " $3 ", " $4 }' && \
	echo "$TMP_OUTPUT" | grep -i \ \ applications\ clocks -A 2 | grep -i graphics | awk '{print ", Clk App, " $3 ", " $4 }' \
)`

TMP_OUTPUT=$(sensors max6581-\*)
logger `(echo "k-Sensor, Internal, "                  && echo "$TMP_OUTPUT" | grep -i  Internal\ Temp                     | awk '{print $4}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, Network Switch, "            && echo "$TMP_OUTPUT" | grep -i  Network\ Switch\ Temp              | awk '{print $4}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, Quad 1GB PHY, "              && echo "$TMP_OUTPUT" | grep -i  Quad\ 1GB\ PHY                     | awk '{print $7}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, PCIe Switch, "               && echo "$TMP_OUTPUT" | grep -i  PCIe\ Switch\ Temp                 | awk '{print $4}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, 10GB  PHY, "                 && echo "$TMP_OUTPUT" | grep -i  10GB\ PHY\ Temp                    | awk '{print $4}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, 2.5GB  PHY, "                && echo "$TMP_OUTPUT" | grep -i  2.5GB\ PHY\ Temp                   | awk '{print $4}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, PCIe Clock Gen, "            && echo "$TMP_OUTPUT" | grep -i  PCIe\ Clock\ Gen\ Temp             | awk '{print $5}' | sed s/+// | sed s/°C/\,\ C\,/ ) `
logger `(echo "k-Sensor, Network Switch Clock Gen, "  && echo "$TMP_OUTPUT" | grep -i  Network\ Switch\ Clock\ Gen\ Temp  | awk '{print $6}' | sed s/+// | sed s/°C/\,\ C\,/ ) `

TMP_OUTPUT=$(sensors nct7802-\*)
logger `(echo "k-Sensor, VCORE temp,"                 && echo "$TMP_OUTPUT" | grep -i VCORE_temp  | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/)`
logger `(echo "k-Sensor, HWMON Temp,"                 && echo "$TMP_OUTPUT" | grep -i HWMON_Temp  | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/)`
logger `(echo "k-Sensor, CPU Temp,"                   && echo "$TMP_OUTPUT" | grep -i CPU_temp    | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/)`
logger `(echo "k-Sensor, 3V3, , , "                   && echo "$TMP_OUTPUT" | grep -i 3V3         | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, VCC_RTC, , , "               && echo "$TMP_OUTPUT" | grep -i VCC_RTC     | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, VCC_12V, , , "               && echo "$TMP_OUTPUT" | grep -i VCC_12V     | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, VCC_5V_SBY, , , "            && echo "$TMP_OUTPUT" | grep -i VCC_5V_SBY  | awk '{print $2 ",  " $3 }')`

TMP_OUTPUT=$(sensors ads7830-\*)
logger `(echo "k-Sensor, V_2V8_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_2V8_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_3V3_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_3V3_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_1V2_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_1V2_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_1V5_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_1V5_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_12V_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_12V_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_12V_S5, , , "              && echo "$TMP_OUTPUT" | grep -i V_12V_S5    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_5V0_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_5V0_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_2V5_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_2V5_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_1V8_S0, , , "              && echo "$TMP_OUTPUT" | grep -i V_1V8_S0    | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_2V0_AQR, , , "             && echo "$TMP_OUTPUT" | grep -i V_2V0_AQR   | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, V_1V0_AQR, , , "             && echo "$TMP_OUTPUT" | grep -i V_1V0_AQR   | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, 12V_S0_IMON, , , , ,"        && echo "$TMP_OUTPUT" | grep -i 12V_S0_IMON | awk '{print $2 ",  " $3 }')`
logger `(echo "k-Sensor, NTC3_EXT, "                  && echo "$TMP_OUTPUT" | grep -i NTC3_EXT    | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/)`
logger `(echo "k-Sensor, NTC1_A2D, "                  && echo "$TMP_OUTPUT" | grep -i NTC1_A2D    | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/)`
logger `(echo "k-Sensor, NTC2_A2D, "                  && echo "$TMP_OUTPUT" | grep -i NTC2_A2D    | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/)`


TMP_OUTPUT=$(sensors sic451-i2c-*-10)
logger `(echo "k-Sensor, V_5V0_S5, "  && \
	echo "$TMP_OUTPUT" | grep -i Temp      | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/ && \
	echo "$TMP_OUTPUT" | grep -i V_5V0_S5  | awk '{print $2 ", " $3 ", "}' && \
	echo "$TMP_OUTPUT" | grep -i amp\ out  | awk '{print $3 ", " $4}' \
)`

TMP_OUTPUT=$(sensors sic451-i2c-*-11)
logger `(echo "k-Sensor, V_3V3_S5, "  && \
	echo "$TMP_OUTPUT" | grep -i Temp      | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/ && \
	echo "$TMP_OUTPUT" | grep -i V_3V3_S5  | awk '{print $2 ", " $3 ", "}' && \
	echo "$TMP_OUTPUT" | grep -i amp\ out  | awk '{print $3 ", " $4}' \
)`

TMP_OUTPUT=$(sensors sic451-i2c-*-12)
logger `(echo "k-Sensor, V_3V3_S0, "  && \
	echo "$TMP_OUTPUT" | grep -i Temp      | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/ && \
	echo "$TMP_OUTPUT" | grep -i V_3V3_S0  | awk '{print $2 ", " $3 ", "}' && \
	echo "$TMP_OUTPUT" | grep -i amp\ out  | awk '{print $3 ", " $4}' \
)`

TMP_OUTPUT=$(sensors sic451-i2c-*-13)
logger `(echo "k-Sensor, V_1V0_S0, "  && \
	echo "$TMP_OUTPUT" | grep -i Temp      | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/ && \
	echo "$TMP_OUTPUT" | grep -i V_1V0_S0  | awk '{print $2 ", " $3 ", "}' && \
	echo "$TMP_OUTPUT" | grep -i amp\ out  | awk '{print $3 ", " $4}' \
)`

TMP_OUTPUT=$(sensors sic451-i2c-*-14)
logger `(echo "k-Sensor, V_0V7_AQR, "  && \
	echo "$TMP_OUTPUT" | grep -i Temp      | awk '{print $2}' | sed s/+// | sed s/°C/\,\ C\,/ && \
	echo "$TMP_OUTPUT" | grep -i V_0V7_AQR | awk '{print $2 ", " $3 ", "}' && \
	echo "$TMP_OUTPUT" | grep -i amp\ out  | awk '{print $3 ", " $4}' \
)`

TMP_OUTPUT=$(/usr/sbin/smartctl -a /dev/sda)
logger `(echo "k-Sensor, " && echo "$TMP_OUTPUT" | grep -i Device\ Model\: | awk '{ print $3 " " $4}' && echo "$TMP_OUTPUT" | grep -i temperature_Celsius    | awk '{print ", " $10 ", C"}')`


TMP_OUTPUT=$(cat /proc/cpuinfo)
logger `(echo "$TMP_OUTPUT" | awk 'BEGIN {ORS = " "; printf "k-Sensor, CPU Freq,,,,,,,,,,"} /processor/{print "processor:" $3 }/MHz/{print ", " $4 ","}')`
logger `(echo "$TMP_OUTPUT" | grep -i processor -A 7  | grep -iv micro | grep -i :\ 0 -A 6 | grep -i MHZ | awk '{print "k-Sensor,  Processor 0 Freq, " $4 ", MHz" }')`

