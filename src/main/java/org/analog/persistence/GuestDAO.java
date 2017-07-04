package org.analog.persistence;

import org.analog.domain.GuestVO;

public interface GuestDAO {
	
	public void createGuest(String m_id);

	public GuestVO selectGuest(String m_id);

}
