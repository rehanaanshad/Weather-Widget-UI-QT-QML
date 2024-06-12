# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\WeatherWidgetUI_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\WeatherWidgetUI_autogen.dir\\ParseCache.txt"
  "WeatherWidgetUI_autogen"
  )
endif()
