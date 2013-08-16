with system;	use system;
with system.storage_elements;	use system.storage_elements;
with constants;	use constants;
with interfaces;	use interfaces;

package platform_mmio is
	function init(
			subsystem_offset : in storage_offset) return system.address;
	function init0 return unsigned_32;
	-- todo size specific nullificator
end platform_mmio;
