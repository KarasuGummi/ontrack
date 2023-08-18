// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import BuddyimgController from "./buddyimg_controller";
application.register("buddyimg", BuddyimgController);

