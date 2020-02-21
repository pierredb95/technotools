import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr"
import "../plugins/play_music"
import "../plugins/youtube_player"
import "../plugins/my_vinyls_and_bookings";


initMapbox();

