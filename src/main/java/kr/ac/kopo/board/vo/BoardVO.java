package kr.ac.kopo.board.vo;

public class BoardVO {

    private int post_id;
    private String title;
    private String writerId;
    private String content;
    private String location;
    private int pay;
    private String workTime;
    private String regDate;
    private String deadline;

    // 기본 생성자
    public BoardVO() {
    }

    // 전체 필드 생성자
    public BoardVO(int post_id, String title, String writerId, String content,
                   String location, int pay, String workTime, String regDate, String deadline) {
        this.post_id = post_id;
        this.title = title;
        this.writerId = writerId;
        this.content = content;
        this.location = location;
        this.pay = pay;
        this.workTime = workTime;
        this.regDate = regDate;
        this.deadline = deadline;
    }

    // postId를 제외한 생성자 (insert 시 사용)
    public BoardVO(String title, String writerId, String content,
                   String location, int pay, String workTime, String regDate, String deadline) {
        this.title = title;
        this.writerId = writerId;
        this.content = content;
        this.location = location;
        this.pay = pay;
        this.workTime = workTime;
        this.regDate = regDate;
        this.deadline = deadline;
    }

    // Getter & Setter
    public int getPostId() {
        return post_id;
    }

    public void setPostId(int postId) {
        this.post_id = postId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriterId() {
        return writerId;
    }

    public void setWriterId(String writerId) {
        this.writerId = writerId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    @Override
    public String toString() {
        return "BoardVO [postId=" + post_id + ", title=" + title + ", writerId=" + writerId +
               ", content=" + content + ", location=" + location + ", pay=" + pay +
               ", workTime=" + workTime + ", regDate=" + regDate + ", deadline=" + deadline + "]";
    }
}
