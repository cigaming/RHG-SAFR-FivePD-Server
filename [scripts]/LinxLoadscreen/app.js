/* -----------------------------------------------
/* How to use? : Check the GitHub README
/* ----------------------------------------------- */

/* To load a config file (particles.json) you need to host this demo (MAMP/WAMP/local)... */
/*
particlesJS.load('particles-js', 'particles.json', function() {
  console.log('particles.js loaded - callback');
});
*/

/* Otherwise just put the config content (json): */

particlesJS('particles-js',

  {
    "particles": {
      "number": {
        "value": 400,
        "density": {
          "enable": true,
          "value_area": 800
        }
      },
      "color": {
        "value": "#ffffff"
      },
      "shape": {
        "type": "circle",
        "stroke": {
          "width": 0,
          "color": "#000000"
        },
        "polygon": {
          "nb_sides": 5
        },
        "image": {
          "src": "img/github.svg",
          "width": 100,
          "height": 100
        }
      },
      "opacity": {
        "value": 0.5,
        "random": true,
        "anim": {
          "enable": false,
          "speed": 0.2,
          "opacity_min": 0.1,
          "sync": false
        }
      },
      "size": {
        "value": 10,
        "random": true,
        "anim": {
          "enable": false,
          "speed": 40,
          "size_min": 0.1,
          "sync": false
        }
      },
      "line_linked": {
        "enable": false,
        "distance": 500,
        "color": "#ffffff",
        "opacity": 0.4,
        "width": 2
      },
      "move": {
        "enable": true,
        "speed": 1,
        "direction": "bottom",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "bounce": false,
        "attract": {
          "enable": false,
          "rotateX": 600,
          "rotateY": 1200
        }
      }
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": {
        "onhover": {
          "enable": false,
          "mode": "repulse"
        },
        "onclick": {
          "enable": false,
          "mode": "push"
        },
        "resize": true
      },
      "modes": {
        "grab": {
          "distance": 400,
          "line_linked": {
            "opacity": 0.5
          }
        },
        "bubble": {
          "distance": 400,
          "size": 4,
          "duration": 0.3,
          "opacity": 1,
          "speed": 3
        },
        "repulse": {
          "distance": 200
        },
        "push": {
          "particles_nb": 4
        },
        "remove": {
          "particles_nb": 2
        }
      }
    },
    "retina_detect": true,

  }

);


/* Need Help? Join my discord @ discord.gg/yWddFpQ */

// And yes... I know this is __very__ messy.

/* Uncomment for PLAIN TEXT (also uncomment title in index)  document.getElementById('title').innerHTML = config.text.title;  */
//document.getElementById('link').innerHTML = config.text.link;
//var audio = `<div data-video=${config.videoID} data-autoplay="1" data-loop="1" id="youtube-audio"> </div>`;
// if (config.music === true) {
//  $("body").append(audio);
// }

// $(function () {
//
//     var llllll = config.images.forEach(appen)
//     function appen(i) {
//         document.getElementById("bg").innerHTML= document.getElementById("bg").innerHTML + `<img width="100%"height="100%" src=imgs/${i}>`;
// }
//     function random(pp) {
//         return Math.floor(Math.random() * pp);
//     }
//     var img = $('div#bg img');
//     var len = img.length;
//     var current = random(len);
//     img.hide();
//     img.eq(current).show();
//
//     var x = setInterval(function () {
//         img.eq(current).fadeOut(config.transitionInterval, function () {
//             current = random(len);
//             img.eq(current).fadeIn(config.transitionInterval);
//         });
//     }, 2 * config.transitionInterval + config.imgInterval);
// })

/* forked from https://cdn.rawgit.com/labnol/files/master/yt.js */
// function onYouTubeIframeAPIReady() {
// var e = document.getElementById("youtube-audio"),
// t = document.createElement(null);
// e.appendChild(t); var a = document.createElement("div");
// a.setAttribute("id", "youtube-player"), e.appendChild(a);
// var o = function (e) {
//     t.setAttribute("src", "https://i.imgur.com/" + a) };
//     e.onclick = function () { r.getPlayerState() === YT.PlayerState.PLAYING || r.getPlayerState() === YT.PlayerState.BUFFERING ? (r.pauseVideo(), o(!1)) : (r.playVideo(), o(!0)) }; var r = new YT.Player("youtube-player", { height: "0", width: "0", videoId: e.dataset.video, playerVars: { autoplay: e.dataset.autoplay, loop: e.dataset.loop }, events: { onReady: function (e) { r.setPlaybackQuality("small"), r.setVolume(config.musicVolume)
//     o(r.getPlayerState() !== YT.PlayerState.CUED) },
//     onStateChange: function (e) { e.data === YT.PlayerState.ENDED && o(!1) } } })
// }
