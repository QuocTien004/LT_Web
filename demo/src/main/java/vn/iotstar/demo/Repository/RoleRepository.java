package vn.iotstar.demo.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.iotstar.demo.Entity.Role;


public interface RoleRepository extends JpaRepository<Role, Long> {
	@Query("SELECT u FROM ROle u WHERE u.name = :name")
	public Role getUserByName(@Param("name") String name);
	Optional<Role> findByName (String name);
}
