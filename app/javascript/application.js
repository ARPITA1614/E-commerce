import Rails from "@rails/ujs"
Rails.start()
window.Rails=Rails
console.log("UJS loaded")
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap" 
