#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install firefox firefox-extension-mailvelope

# tampermonkey
xdg-open https://greasyfork.org/zh-CN/scripts/445274-searchjumper
xdg-open https://greasyfork.org/zh-CN/scripts/28770-bilibili-%E8%87%AA%E5%8A%A8%E7%BD%91%E9%A1%B5%E5%85%A8%E5%B1%8F
xdg-open https://greasyfork.org/zh-CN/scripts/440871-%E9%AA%9A%E6%89%B0%E6%8B%A6%E6%88%AA
xdg-open https://greasyfork.org/zh-CN/scripts/28497-%E7%BD%91%E9%A1%B5%E9%99%90%E5%88%B6%E8%A7%A3%E9%99%A4-%E6%94%B9
xdg-open https://greasyfork.org/zh-CN/scripts/405130-%E6%96%87%E6%9C%AC%E9%80%89%E4%B8%AD%E5%A4%8D%E5%88%B6
xdg-open https://greasyfork.org/zh-CN/scripts/439557-%E6%96%87%E6%9C%AC%E9%80%89%E4%B8%AD%E5%A4%8D%E5%88%B6-%E9%80%9A%E7%94%A8
xdg-open https://greasyfork.org/zh-CN/scripts/378351-%E6%8C%81%E7%BB%AD%E6%9B%B4%E6%96%B0-csdn%E5%B9%BF%E5%91%8A%E5%AE%8C%E5%85%A8%E8%BF%87%E6%BB%A4-%E4%BA%BA%E6%80%A7%E5%8C%96%E8%84%9A%E6%9C%AC%E4%BC%98%E5%8C%96-%E4%B8%8D%E7%94%A8%E5%86%8D%E7%99%BB%E5%BD%95%E4%BA%86-%E8%AE%A9%E4%BD%A0%E4%BD%93%E9%AA%8C%E4%BB%A4%E4%BA%BA%E6%83%8A%E5%96%9C%E7%9A%84%E5%B4%AD%E6%96%B0csdn
xdg-open https://greasyfork.org/zh-CN/scripts/428960-csdn-%E7%9F%A5%E4%B9%8E-%E5%93%94%E5%93%A9%E5%93%94%E5%93%A9-%E7%AE%80%E4%B9%A6%E5%85%8D%E7%99%BB%E5%BD%95%E5%8E%BB%E9%99%A4%E5%BC%B9%E7%AA%97%E5%B9%BF%E5%91%8A
xdg-open https://greasyfork.org/en/scripts/412245-github-%E5%A2%9E%E5%BC%BA-%E9%AB%98%E9%80%9F%E4%B8%8B%E8%BD%BD

# plugin
firefox https://addons.mozilla.org/zh-CN/firefox/addon/tampermonkey
#firefox https://addons.mozilla.org/zh-CN/firefox/addon/mailvelope
firefox https://addons.mozilla.org/zh-CN/firefox/addon/octotree
firefox https://addons.mozilla.org/zh-CN/firefox/addon/%E8%85%BE%E8%AE%AF%E7%BF%BB%E8%AF%91/
firefox https://addons.mozilla.org/zh-CN/firefox/addon/immersive-translate
firefox https://addons.mozilla.org/zh-CN/firefox/addon/vimium-c/
firefox https://addons.mozilla.org/zh-CN/firefox/addon/darkreader

# other plugin
xdg-open https://github.com/gorhill/uBlock/releases
#firefox https://github.com/gorhill/uBlock-for-firefox-legacy/releases

cp_conf_home ".local/bin/s"
