return {
	'jira',
	types = { 'carlender' },
	on_save = function(carlender)
		for _, appointment in ipairs(carlender.appointments) do
			print(vim.inspect(appointment.bundle))
		end
	end,
	commands = {
		["JiraStage"] = function(carlender)
			print('we are executing the right command with carlender', vim.inspect(carlender))
			for _, appointment in carlender.appointments do
				if appointment:has_tag('#work') then
					appointment:add_action('~jira')
				end
			end
			carlender:save()
		end
	},
}
