const app = new Vue({
  el: "#app",
  data: {
    resourcename: "k9",
    visible: false,
    menu: "K9",
    components: [],
    selectedComponent: 1
  },
  methods: {
    SetResourceName(data) {
      this.resourcename = data.resource;
    },
    ShowMenu() {
      this.visible = true;
    },
    HideMenu() {
      this.visible = false;
    },
    ChangeMenu(data) {
      this.menu = data.title;
      this.components = data.components
    },
    SetSelectedComponent(data) {
      this.selectedComponent = data.component
    },
    UpdateRangeSlider(data) {
      this.components[this.selectedComponent - 1].Title = data.Title
    }
  },

  // EVENTS
  mounted() {
    RegisterEvent("set_resource_name", this.SetResourceName);
    RegisterEvent("show_menu", this.ShowMenu);
    RegisterEvent("hide_menu", this.HideMenu);
    RegisterEvent("change_menu", this.ChangeMenu);
    RegisterEvent("set_selected_component", this.SetSelectedComponent);
    RegisterEvent("update_range_slider", this.UpdateRangeSlider);
  }
})