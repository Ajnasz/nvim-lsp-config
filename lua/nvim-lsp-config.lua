local function setup()
	vim.lsp.add_filetype_config {
		name = "clangd";
		filetype = {"c", "cpp"};
		cmd = "clangd-7 -background-index";
		capabilities = {
			offsetEncoding = {"utf-8", "utf-16"};
		};

		on_init = vim.schedule_wrap(function(client, result)
			if result.offsetEncoding then
				client.offset_encoding = result.offsetEncoding
			end
		end)
	}

	vim.lsp.add_filetype_config {
		name = "go";
		filetype = {"go"};
		cmd = "gopls";
	}

	vim.lsp.add_filetype_config {
		name = "python";
		filetype = {"pyls"};
		cmd = "pyls";
	}

	vim.lsp.add_filetype_config {
		name = "rust";
		filetype = {"rls"};
		cmd = "rls";
		capabilities = {
			clippy_preference = "on";
			all_targets = false;
			build_on_save = true;
			wait_to_build = 0;
		};
	}

	vim.lsp.add_filetype_config {
		filetype = {"javascript", "typescript"};
		name = "tsserver";
		cmd = "javascript-typescript-stdio";
	}

	vim.lsp.add_filetype_config {
		filetype = {"css", "scss", "less"};
		name = "css-languageserver";
		cmd = "css-languageserver";
	}

	print("lsp configuration done")
end

return {
	setup = setup;
}
