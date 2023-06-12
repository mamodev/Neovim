local status, scrollbar = pcall(require, "scrollbar")
if not status then
	return
end


scrollbar.setup({
     marks = {
        Error = { color = '#f7768e' }
    }
})
