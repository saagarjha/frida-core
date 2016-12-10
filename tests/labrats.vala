namespace Frida.Test.Labrats {
	public static string path_to_executable (string name, Arch arch = Arch.CURRENT) {
		return path_to_file (name + os_arch_suffix (arch) + os_executable_suffix ());
	}

	public static string path_to_library (string name, Arch arch = Arch.CURRENT) {
		return path_to_file (name + os_arch_suffix (arch) + os_library_suffix ());
	}

	public static string path_to_file (string name) {
		var tests_dir = Path.get_dirname (Process.current.filename);
		var data_dir = Path.build_filename (tests_dir, "data");
		return Path.build_filename (data_dir, name);
	}

	public static Process start (string name, string[]? envp = null, Arch arch = Arch.CURRENT) throws Error {
		var rat_file = path_to_executable (name);

		var argv = new string[] {
			rat_file
		};

		return Process.start (rat_file, argv, envp, arch);
	}
}
