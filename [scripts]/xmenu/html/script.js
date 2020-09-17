const app = new Vue({
  el: "#app",
  data: {
    resource: "xmenu",
    visible: false,

    // Menu
    MenuName: "Default",
    MenuComponents: {},
    MenuOption: 0
  },
  methods: {
    SetResourceData(data) {
      this.resource = data.resource;
    },
    OpenMenu(data) {
      this.MenuName = data.name;
      this.MenuComponents = data.components;
      this.MenuOption = data.option - 1;
      this.visible = true;
    },
    CloseMenu() {
      this.MenuName = "";
      this.MenuComponents = {};
      this.MenuOption = 0;
      this.visible = false;
    },
    SetMenuOption(data) {
      this.MenuOption = data.option - 1;
    },
    SetCheckboxState(data) {
      const comp = this.GetMenuIndexById(data.id)
      if (comp != null) {
        this.MenuComponents[comp].state = data.state
      }
    },
    SetListItem(data) {
      this.MenuComponents.forEach(comp => {
        if (comp.index == data.index) {
          comp.listIndex = data.listIndex
        }
      });
    },
    GetMenuIndexById(id) {
      for (let a = 0; a < this.MenuComponents.length; a++) {
        if (this.MenuComponents[a].index == id) {
          return a
        }
      }
      return null;
    }
  },
  mounted() {
    RegisterEvent("set_resource_data", this.SetResourceData);
    RegisterEvent("open_menu", this.OpenMenu);
    RegisterEvent("close_menu", this.CloseMenu);
    RegisterEvent("set_menu_option", this.SetMenuOption);
    RegisterEvent("set_checkbox_state", this.SetCheckboxState);
    RegisterEvent("set_list_item", this.SetListItem);
  }
})