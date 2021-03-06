// default package
// Generated 25 juin 2018 11:15:45 by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Language generated by hbm2java
 */
@Entity
@Table(name = "language", catalog = "quranspace")
public class Language implements java.io.Serializable {

	private Integer idLanguage;
	private String titre;

	public Language() {
	}

	public Language(String titre) {
		this.titre = titre;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id_language", unique = true, nullable = false)
	public Integer getIdLanguage() {
		return this.idLanguage;
	}

	public void setIdLanguage(Integer idLanguage) {
		this.idLanguage = idLanguage;
	}

	@Column(name = "titre", nullable = false, length = 60)
	public String getTitre() {
		return this.titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

}
