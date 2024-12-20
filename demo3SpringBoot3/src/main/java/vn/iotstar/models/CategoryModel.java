package vn.iotstar.models;

import java.io.Serializable;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CategoryModel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private Long id;
	@NotEmpty(message = "Không được bỏ trống")
	private String name;
	private String images;
	private int status;

	//private Boolean isEdit = false;
	private Boolean isEdit = false; // Khai báo isEdit
	
	public Boolean getIsEdit() {
	    return isEdit;
	}

	public void setIsEdit(Boolean isEdit) {
	    this.isEdit = isEdit;
	}
}
