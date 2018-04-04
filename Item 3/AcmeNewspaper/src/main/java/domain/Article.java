
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Article extends DomainEntity {

	private String				title;
	private String				summary;
	private String				text;
	private Date				publishMoment;
	private Collection<String>	pictures;
	private boolean				draftMode;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	@NotBlank
	public String getSummary() {
		return this.summary;
	}

	@NotBlank
	public String getText() {
		return this.text;
	}

	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	public Date getPublishMoment() {
		return this.publishMoment;
	}

	@NotNull
	@ElementCollection
	public Collection<String> getPictures() {
		return this.pictures;
	}

	public void setPictures(final Collection<String> pictures) {
		this.pictures = pictures;
	}

	@NotNull
	public boolean isDraftMode() {
		return this.draftMode;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	public void setSummary(final String summary) {
		this.summary = summary;
	}

	public void setText(final String text) {
		this.text = text;
	}

	public void setPublishMoment(final Date publishMoment) {
		this.publishMoment = publishMoment;
	}

	public void setDraftMode(final boolean draftMode) {
		this.draftMode = draftMode;
	}

	//Relationships

}
