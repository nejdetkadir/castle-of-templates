// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "trix";
import "@rails/actiontext";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "bootstrap/dist/js/bootstrap.bundle";
import "codemirror/lib/codemirror.js";
import "codemirror/mode/ruby/ruby.js";
import ClipboardJS from "clipboard/dist/clipboard.min.js";

import highlight from "highlight.js/lib/index.js";

import CodeMirror from "codemirror";
global.Swal = require("sweetalert2");

document.addEventListener("turbolinks:load", function() {
  document.querySelector("#navbarSideCollapse").addEventListener("click", function () {
    document.querySelector(".offcanvas-collapse").classList.toggle("open")
  });

  if (document.body.contains(document.querySelector("textarea[data-controller='editor']"))) {
    CodeMirror.fromTextArea(document.querySelector("textarea[data-controller='editor']"), {
      lineNumbers: true,
      mode: "ruby",
      tabSize: 2,
      theme: "moxer"
    });
  }

  document.querySelectorAll('pre code').forEach((el) => {
    highlight.highlightElement(el);
  });

  new ClipboardJS("button[data-controller='clipboard']");
});
