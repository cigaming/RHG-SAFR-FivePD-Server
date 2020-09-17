const EVENTS = []

document.onreadystatechange = () => {
  if (document.readyState == "complete") {
    window.addEventListener("message", (event) => {
      EVENTS.forEach(e => {
        if (e.event == event.data.type) {
          e.callback(event.data.data);
        }
      });
    })

    axios.post("http://" + app.resourcename + "/k9_menu_ready", {});
  }
}

function RegisterEvent(event, callback) {
  EVENTS.push({ event, callback });
}