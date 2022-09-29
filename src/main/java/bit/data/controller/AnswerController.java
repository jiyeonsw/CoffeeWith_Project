package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import bit.data.dto.BoardAnswerDto;
import bit.data.service.BoardAnswerServiceInter;
import util.ChangeName;

@RestController
@RequestMapping("/answer")
public class AnswerController {
	@Autowired
	BoardAnswerServiceInter answerService;
	
	String uploadPhoto;
		
	@PostMapping("/updatephoto")
	public Map<String, String> photoUpload(HttpServletRequest request, MultipartFile photo) {
		
		//톰캣에 올라간 upload 폴더 경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//업로드할 파일명 구하기(현재날짜 파일명 변경)
		uploadPhoto = ChangeName.getChangeFileName(photo.getOriginalFilename());
		
		try {
			photo.transferTo(new File(path+"/"+uploadPhoto));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, String> map=new HashMap<>();
		map.put("aphoto", uploadPhoto);
		
		return map;// /member/list 매핑 주소 호출 - 컨트롤러 메서드 호출
	}
	
	@PostMapping("/insert")
	public void insert(BoardAnswerDto dto) {
		//사진만 따로 저장후 db insert
		if(uploadPhoto==null){//사진을 선택안했을 경우
			dto.setPhoto("no");
		}else {
			dto.setPhoto(uploadPhoto);
		}
		answerService.insertAnswer(dto);
		uploadPhoto = null;//그다음 댓글을 위해서 사진이름은 null로 초기화
	}
	
	@GetMapping("/list")
	public List<BoardAnswerDto> list(int num){
//		System.out.print(num);
		return answerService.getAllAnswerList(num);
	}
	
	
	@GetMapping("/delete")
	public void delete(int idx,HttpServletRequest request) {
		//업로드될 경로 구하기
		//톰캣에 올라간 upload 폴더 경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		
		String photo = answerService.getAnswer(idx).getPhoto();
		
		File file = new File(path+"/"+photo);
		
		if(file.exists()) {
			System.out.println("파일이 존재하므로 삭제합니다");
			file.delete();
		}
		
		answerService.deleteAnswer(idx);
	}
	
	
	
}
