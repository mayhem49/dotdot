return {
  "chrisgrieser/nvim-early-retirement",
  event = "VeryLazy",
  config = function()
    require('early-retirement').setup({
      defaultOpts={
        retirementAgeMins = 10,
        minimumBufferNum = 4,
      }
    })
  end
}
