package com.mcrh.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mcrh.data.Child;
import com.mcrh.data.ChildRepo;
import com.mcrh.data.Mother;
import com.mcrh.data.MotherRepo;
import com.mcrh.data.Record;
import com.mcrh.data.RecordRepo;
import com.mcrh.data.Users;
import com.mcrh.data.UsersRepo;

@Controller
@SessionAttributes({ "updatee" })
public class HomeController {

	@Autowired
	RecordRepo recordrepo;
	@Autowired
	MotherRepo momrepo;
	@Autowired
	ChildRepo chrepo;
	@Autowired
	UsersRepo usersrepo;

	@ModelAttribute("record")
	public Record recordb() {
		return new Record();
	}

	@ModelAttribute("mother")
	public Mother savemother() {
		return new Mother();
	}

	@ModelAttribute("child")
	public Child children() {
		return new Child();
	}

	@ModelAttribute("users")
	public Users user() {
		return new Users();
	}

	@RequestMapping(value = "/")
	public String home() {
		StandardPasswordEncoder encoder = new StandardPasswordEncoder();
		Users a = new Users();
		a.setUsername("Records");
		a.setEnabled(true);
		a.setRole("ROLE_USER");
		String encodedPassword = encoder.encode("Records2019");
		a.setPassword(encodedPassword);
		a.setEnabled(true);
		usersrepo.save(a);
		return "home";
	}

	@RequestMapping(value = "/add")
	public String addrecord() {
		return "addrecord";
	}

	@RequestMapping(value = "/search")
	public String search(@ModelAttribute Record r, Model model) throws ParseException {
		List<Record> recs = new ArrayList<>();
		recs.addAll(recordrepo.findByChildDob(r.getChild().getDob()));
		recs.forEach(rec -> {
			String d,c;
			try {
				d = new SimpleDateFormat("MM/dd/yyyy").format(rec.getChild().getDob());
				 c = new SimpleDateFormat("MM/dd/yyyy").format(rec.getNotificationdate());
					rec.getChild().setSdob(d);
					rec.setSnotificationdate(c);
			} catch (Exception e) {

				e.printStackTrace();
			}

		});
		model.addAttribute("results", recs);
		return "results";
	}

	@RequestMapping(value = "/searchbtwn")
	public String searchbtwnpage() {
		return "btwnpage";
	}

	@RequestMapping(value = "/searchbetween")
	public String sch(@ModelAttribute Record r, Model model) throws ParseException {
		List<Record> recs = new ArrayList<>();
		recs.addAll(recordrepo.findByNotificationdateBetween(r.getNotificationdate(), r.getChild().getDob()));
		recs.forEach(rec -> {
			String d,c;
			try {
				d = new SimpleDateFormat("MM/dd/yyyy").format(rec.getChild().getDob());
				 c = new SimpleDateFormat("MM/dd/yyyy").format(rec.getNotificationdate());
					rec.getChild().setSdob(d);
					rec.setSnotificationdate(c);
			} catch (Exception e) {

				e.printStackTrace();
			}

		});
		model.addAttribute("results", recs);
		return "btwnpage";
	}

	@RequestMapping(value = "/register")
	@ResponseBody
	public String savings(@ModelAttribute Record r, Model model) {
		try {
			if (r.getMother().getIdno() == 0) {
				r.getMother().setIdno(r.getNotificationtoid());
			}
			momrepo.save(r.getMother());
			recordrepo.save(r);

		} catch (Exception e1) {

			return "Serial Number Exist Make sure it has not been used before";
		}
		return "Record Saved Successfully";
	}

	@RequestMapping(value = "/allrecords")
	public String allrecords(Model model) throws Exception {
		List<Record> recs = new ArrayList<>();
		recs.addAll(recordrepo.findAll());
		recs.forEach(rec -> {
			String d,c;
			try {
				d = new SimpleDateFormat("MM/dd/yyyy").format(rec.getChild().getDob());
				 c = new SimpleDateFormat("MM/dd/yyyy").format(rec.getNotificationdate());
				rec.getChild().setSdob(d);
				rec.setSnotificationdate(c);
			} catch (Exception e) {

				e.printStackTrace();
			}

		});
		model.addAttribute("records", recs);
		return "record";
	}

	@RequestMapping(value = "/reports")
	public String report(Model model) {
		return "sidebar";

	}

	@RequestMapping(value = "/monthlyreport")
	public String month(Model model) {
		return "monthlyreport";

	}

	@RequestMapping(value = "/anyyear")
	@ResponseBody
	public List<List<Integer>> anyyaer(Model model, @ModelAttribute Record rec) {
		List<Record> reps = recordrepo.anyyear(rec.getNotificationdate());
		List<List<Integer>> report = new ArrayList<>(Arrays.asList(yearmalefemaletotal(reps).get(0),
				yearmalefemaletotal(reps).get(1), yearmalefemaletotal(reps).get(2), general(reps).get(0),
				general(reps).get(1), general(reps).get(2)));
		return report;

	}

	@RequestMapping(value = "/anymonth")
	@ResponseBody
	public List<List<Integer>> anymonth(Model model, @ModelAttribute Record rec) {
		List<Record> reps = recordrepo.anymonth(rec.getNotificationdate());
		return monthgeneral(reps);

	}

	@RequestMapping(value = "/edit")
	@ResponseBody
	public List<List<Integer>> monthreport(Model model) {
		List<Record> reps = recordrepo.thisyear();

		List<List<Integer>> report = new ArrayList<>(Arrays.asList(yearmalefemaletotal(reps).get(0),
				yearmalefemaletotal(reps).get(1), yearmalefemaletotal(reps).get(2), general(reps).get(0),
				general(reps).get(1), general(reps).get(2)));
		return report;

	}

	@RequestMapping(value = "/thismonth")
	@ResponseBody
	public List<List<Integer>> monthr(Model model) {
		List<Record> reps = recordrepo.thismonth();
		return monthgeneral(reps);

	}

	@SuppressWarnings("deprecation")
	public List<List<Integer>> yearmalefemaletotal(List<Record> reps) {
		List<Integer> total = new ArrayList<>(
				Arrays.asList((int) reps.stream().filter(x -> 0 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 1 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 2 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 3 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 4 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 5 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 6 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 7 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 8 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 9 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 10 == x.getNotificationdate().getMonth()).count(),
						(int) reps.stream().filter(x -> 11 == x.getNotificationdate().getMonth()).count()));

		List<Integer> boys = new ArrayList<>(Arrays.asList(
				(int) reps.stream().filter(x -> 0 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 1 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 2 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 3 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 4 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 5 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 6 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 7 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 8 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 9 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 10 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 11 == x.getNotificationdate().getMonth())
						.filter(x -> "Male".equals(x.getChild().getSex())).count()));

		List<Integer> girls = new ArrayList<>(Arrays.asList(
				(int) reps.stream().filter(x -> 0 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 1 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 2 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 3 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 4 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 5 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 6 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 7 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 8 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 9 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 10 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count(),
				(int) reps.stream().filter(x -> 11 == x.getNotificationdate().getMonth())
						.filter(x -> "Female".equals(x.getChild().getSex())).count()));

		List<List<Integer>> malefemale = new ArrayList<>(Arrays.asList(boys, girls, total));

		return malefemale;

	}

	public List<List<Integer>> general(List<Record> reps) {
		List<Integer> gender = new ArrayList<>(
				Arrays.asList((int) reps.stream().filter(x -> "Male".equals(x.getChild().getSex())).count(),
						(int) reps.stream().filter(x -> "Female".equals(x.getChild().getSex())).count()));
		List<Integer> nature = new ArrayList<>(
				Arrays.asList((int) reps.stream().filter(x -> "Alive".equals(x.getChild().getBirthnature())).count(),
						(int) reps.stream().filter(x -> "Dead".equals(x.getChild().getBirthnature())).count()));

		List<Integer> type = new ArrayList<>(
				Arrays.asList((int) reps.stream().filter(x -> "Single".equals(x.getChild().getBirthtype())).count(),
						(int) reps.stream().filter(x -> "Twin".equals(x.getChild().getBirthtype())).count(),
						(int) reps.stream().filter(x -> !x.getChild().getBirthtypeother().equals("")).count()));

		List<List<Integer>> general = new ArrayList<>(Arrays.asList(gender, nature, type));
		return general;
	}

	public List<List<Integer>> monthgeneral(List<Record> reps) {
		List<Integer> tot = new ArrayList<>(Arrays.asList(reps.size()));
		List<List<Integer>> report = new ArrayList<>(
				Arrays.asList(tot, general(reps).get(0), general(reps).get(1), general(reps).get(2)));
		return report;
	}

	@RequestMapping(value = "/updaterecord")
	@ResponseBody
	public String updating(@ModelAttribute("updatee") Record r, @ModelAttribute Record rec, Model model,
			SessionStatus status) {
		try {
			if (rec.getMother().getIdno() == 0) {
				rec.getMother().setIdno(r.getNotificationtoid());
			}
			rec.setId(r.getId());
			momrepo.save(rec.getMother());
			recordrepo.save(rec);
			status.setComplete();

		} catch (Exception e1) {

			return "Update Failed";
		}
		return "Record Updated Successfully";
	}

	@RequestMapping(value = "/update/{who}")
	public String update(Model model, @PathVariable("who") int who) {
		Record rec = recordrepo.findByChildSerialno(who);

		String d = new SimpleDateFormat("MM/dd/yyyy").format(rec.getChild().getDob());
		String e = new SimpleDateFormat("MM/dd/yyyy").format(rec.getNotificationdate());
		rec.getChild().setSdob(d);
        rec.setSnotificationdate(e);
		model.addAttribute("updatee", rec);
		return "updatepage";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String gohome(Model model, Authentication auth) {
		return "login";
	}

	@ExceptionHandler(ConstraintViolationException.class)
	public String catching() {
		return "mom exists";
	}
}
