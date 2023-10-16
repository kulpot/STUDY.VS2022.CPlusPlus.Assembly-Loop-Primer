
//ref link:https://www.youtube.com/watch?v=iyuzTG10Xvk&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=21
//

// MyAssembly.asm - (customBuildTool)commandline - ml /c /Cx /coff "%(FullPath)"
// MyAssembly.asm - (customBuildTool)output - %(Filename).obj

// multiply overflow 1111 * 1111 = 11101001
// 32bit overflow 1111 1111 1111 1111 1111 1111 1111 1111 * 1111 1111 1111 1111 1111 1111 1111 1111 = overflow

extern "C" void doit();

void main()
{
	doit();
}

void doit()
{
}
