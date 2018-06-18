// default package
// Generated 7 mai 2018 10:19:17 by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classes generated by hbm2java
 */
@Entity
@Table(name = "classes", catalog = "quranspace")
public class Classes implements java.io.Serializable {

	private Integer idClasses;
	private String name;

	public Classes() {
	}

	public Classes(String name) {
		this.name = name;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id_classes", unique = true, nullable = false)
	public Integer getIdClasses() {
		return this.idClasses;
	}

	public void setIdClasses(Integer idClasses) {
		this.idClasses = idClasses;
	}

	@Column(name = "name", nullable = false, length = 15)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
