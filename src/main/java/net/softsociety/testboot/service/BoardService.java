package net.softsociety.testboot.service;

import java.util.ArrayList;

import net.softsociety.testboot.domain.BoardVO;
import net.softsociety.testboot.domain.BoardWithName;
import net.softsociety.testboot.domain.PageNavigator;

public interface BoardService {
	
	// 글저장
	public int writeBoard(BoardVO board);
	
	//페이지 정보를 담은 객체 생성
	public PageNavigator getgetPageNavigator(int pagePerGroup, int countPerPage, int page, String type,
			String searchWord);
	
	//글 전체 목록
	//public ArrayList<BoardVO> boardListAll(PageNavigator navi, String type, String searchWord);
	public ArrayList<BoardWithName> boardListAll(PageNavigator navi, String type, String searchWord);
	
	//조회수 증가
	public int updateHits(int boardnum);
	
	//글 읽기
	public BoardWithName boardNum(int board_id);
	
	
	

}
