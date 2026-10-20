package com.example.osis.controller;

import com.example.osis.model.OSISConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OSISController {

    @GetMapping("/")
    public String home(Model model) {
        OSISConfig config = new OSISConfig();

        // Nama variabel di dalam tanda petik harus persis sama dengan yang di index.html
        model.addAttribute("namaSekolah", config.getNamaSekolah());
        model.addAttribute("instagram", config.getInstagramUrl());
        model.addAttribute("youtube", config.getYoutubeUrl());
        model.addAttribute("tiktok", config.getTiktokUrl());

        return "index";
    }
}