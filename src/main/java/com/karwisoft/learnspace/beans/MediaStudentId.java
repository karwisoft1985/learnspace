package com.karwisoft.learnspace.beans;

// default package
// Generated 27 avr. 2018 13:23:37 by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * MediaStudentId generated by hbm2java
 */
@Embeddable
public class MediaStudentId implements java.io.Serializable {

	private int idMediaStudent;
	private int idMedia;
	private int idStudent;

	public MediaStudentId() {
	}

	public MediaStudentId(int idMediaStudent, int idMedia, int idStudent) {
		this.idMediaStudent = idMediaStudent;
		this.idMedia = idMedia;
		this.idStudent = idStudent;
	}

	@Column(name = "id_media_student", nullable = false)
	public int getIdMediaStudent() {
		return this.idMediaStudent;
	}

	public void setIdMediaStudent(int idMediaStudent) {
		this.idMediaStudent = idMediaStudent;
	}

	@Column(name = "id_media", nullable = false)
	public int getIdMedia() {
		return this.idMedia;
	}

	public void setIdMedia(int idMedia) {
		this.idMedia = idMedia;
	}

	@Column(name = "id_student", nullable = false)
	public int getIdStudent() {
		return this.idStudent;
	}

	public void setIdStudent(int idStudent) {
		this.idStudent = idStudent;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof MediaStudentId))
			return false;
		MediaStudentId castOther = (MediaStudentId) other;

		return (this.getIdMediaStudent() == castOther.getIdMediaStudent())
				&& (this.getIdMedia() == castOther.getIdMedia()) && (this.getIdStudent() == castOther.getIdStudent());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getIdMediaStudent();
		result = 37 * result + this.getIdMedia();
		result = 37 * result + this.getIdStudent();
		return result;
	}

}
