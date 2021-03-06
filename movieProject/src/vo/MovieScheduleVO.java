package vo;

import java.sql.Date;
import java.sql.Time;

public class MovieScheduleVO {

	private int screenNo;
	private Date screenDate;
	private Date screenTime;
	private int movieID;

	public MovieScheduleVO() {
	}

	public MovieScheduleVO(int screenNo, Date screenDate, Date screenTime, int movieID) {
		this.screenNo = screenNo;
		this.screenDate = screenDate;
		this.screenTime = screenTime;
		this.movieID = movieID;
	}
	
	public MovieScheduleVO(Date screenDate, Date screenTime, int movieID) {
		this.screenDate = screenDate;
		this.screenTime = screenTime;
		this.movieID = movieID;
	}
	

	public int getScreenNo() {
		return screenNo;
	}

	public void setScreenNo(int screenNo) {
		this.screenNo = screenNo;
	}

	public Date getScreenDate() {
		return screenDate;
	}

	public void setScreenDate(Date screenDate) {
		this.screenDate = screenDate;
	}

	public Date getScreenTime() {
		return screenTime;
	}

	public void setScreenTime(Date screenTime) {
		this.screenTime = screenTime;
	}

	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}

}
