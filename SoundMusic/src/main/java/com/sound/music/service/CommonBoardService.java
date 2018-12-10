package com.sound.music.service;

import javax.servlet.http.HttpSession;

import com.sound.music.vo.NoticeVO;

public interface CommonBoardService {
	//01. 게시글 작성
	public void create(NoticeVO vo)throws Exception;
	//02. 게시글 수정
	public void update(NoticeVO vo)throws Exception;
	//03. 게시글 삭제
	public void delete(int no)throws Exception;
	//04. 게시글 조회수
	public void increaseViewcnt(int no,HttpSession session) throws Exception;
}