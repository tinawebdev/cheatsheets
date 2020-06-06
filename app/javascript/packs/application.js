require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")

import "@fortawesome/fontawesome-free/js/all";
import "../stylesheets/application.scss";
import "./navbar.js";
import "./notification.js";
import "./toggle.js";
import "./trix-editor-overrides";
