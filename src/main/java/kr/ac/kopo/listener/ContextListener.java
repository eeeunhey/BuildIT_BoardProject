package kr.ac.kopo.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {

	public void contextDestroyes(ServletContextEvent event) {
		System.out.println("리스너 종료...");
	}
}
