return function(opts)
	require("jdtls").start_or_attach({
		cmd = { "/usr/bin/jdtls" },
		root_dir = vim.fs.dirname(
			vim.fs.find({ "gradlew", ".git", "mvnw", "build.gradle", "build.gradle.kts", "pom.xml" }, { upward = true })[1]
		),
		table.unpack(opts),
	})
end
