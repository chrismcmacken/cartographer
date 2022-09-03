import L from 'leaflet';

let map = L.map('map').setView([74, -66], 3);

L.tileLayer("sword_coast/{z}/{y}/{x}.webp", {
    tileSize: 256,
    crs: L.CRS.Simple,
    minZoom: 3,
    maxZoom: 6,
    noWrap: true
}).addTo(map);