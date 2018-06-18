package com.karwisoft.learnspace.beans;

// default package
// Generated 27 avr. 2018 13:23:37 by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Media generated by hbm2java
 */
@Entity
@Table(name = "media", catalog = "quranspace")
public class Media implements java.io.Serializable {

	private Integer idMedia;
	private String titre;

	public Media() {
	}

	public Media(String titre) {
		this.titre = titre;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id_media", unique = true, nullable = false)
	public Integer getIdMedia() {
		return this.idMedia;
	}

	public void setIdMedia(Integer idMedia) {
		this.idMedia = idMedia;
	}

	@Column(name = "titre", nullable = false)
	public String getTitre() {
		return this.titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

}
