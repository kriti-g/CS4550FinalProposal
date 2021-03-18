// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import { sendLoc } from './socket.js'

function format_loc(loc) {
    let location = {
        timestamp: loc.timestamp,
        latitude: loc.coords.latitude,
        longitude: loc.coords.longitude
    };
    console.log("format_loc", location)
    sendLoc(location);
}

// Based on W3's example code at https://www.w3schools.com/html/html5_geolocation.asp
function getLocation() {
    if(navigator.geolocation) {
        console.log("Getting location");
        navigator.geolocation.getCurrentPosition(format_loc);
    } else {
        console.log("Location support not available");
    }
}

document.getElementById("location_button").addEventListener("click", getLocation);
