#!/bin/bash
#_______________________________________________________________________________________#
#                                                                                       #
#              ██████╗ ██╗      ██████╗  ██████╗ ██████╗ ██╗ █████╗                     #
#             ██╔════╝ ██║     ██╔═████╗██╔═████╗██╔══██╗██║██╔══██╗                    #
#             ██║  ███╗██║     ██║██╔██║██║██╔██║██████╔╝██║███████║                    #
#             ██║   ██║██║     ████╔╝██║████╔╝██║██╔══██╗██║██╔══██║                    #
#             ╚██████╔╝███████╗╚██████╔╝╚██████╔╝██║  ██║██║██║  ██║                    #
#              ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝                    #
#_______________________________________________________________________________________#
#                                                                                       #
#                                                                                       #
#             :       By         :  Gl00ria @gl00ria                                    #
#             :     GitHub       :  https://github.com/gl00ria                          #
#                                                                                       #
#             :     @file        :  extractor.sh                                        #
#             :     @brief       :  Extract whatever Archive you feed it                #
#             :     @requires    :  Bash                                                #
#             :     @optional    :                                                      #
#             :     @Note        :  The archive method must be supported by this chunck #
#_______________________________________________________________________________________#
#                                                                                       #
#             :    Created on   :   07, Mar, 2023                                       #
#             :   Last Updated  :   07, Mar, 2023                                       #
# Update History :                                                                      #
#_______________________________________________________________________________________#
#                                                                                       #

extractor() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract ArchiveFolder.zip."
    else
        case "$1" in
        *.tar.bz2 | *.tbz2 | *.tbz) tar xvjf "$1" ;;
        *.tgz) tar zvxf "$1" ;;
        *.tar.gz) tar xvzf "$1" ;;
        *.tar.xz) tar xvJf "$1" ;;
        *.cbt | *.tar) tar xvf "$1" ;;
        *.cbr | *.rar) unrar x -ad "$1" ;;
        *.cbz | *.epub | *.zip | *.vsix) unzip "$1" ;;
        *.lzo) lzop -d "$1" ;;
        *.gz) gunzip "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.Z) uncompress "$1" ;;
        *.xz | *.txz | *.lzma | *.tlz) xz -d "$1" ;;
        *.exe) cabextract ./"$1" ;;
        *.cpio) cpio -id <./"$1" ;;
        *.cba | *.ace) unace x ./"$1" ;;
        *.7z | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
            7z x "$1"
            ;;
        *) echo "Faild extracting, '$1' - unknown archive method" ;;
        esac
    fi
}
