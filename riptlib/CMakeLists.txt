

add_library ( ript STATIC src/ript.c )
target_include_directories ( ript PUBLIC include )
target_include_directories ( ript PRIVATE src )