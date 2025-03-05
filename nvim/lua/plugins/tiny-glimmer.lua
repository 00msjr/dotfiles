return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  opts = {
    animations = {
      fade = {
        from_color = "#89b4fa",
        to_color = "#89b4fa",
      },
      reverse_fade = {
        from_color = "#f9e2af",
        to_color = "#f9e2af",
      },
    },
    default_animation = "fade",
    paste = {
      default_animation = "reverse_fade",
    },
  },
}
