package com.company.realestate.configs;

import com.company.realestate.domains.enums.RealEstateType;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.assets.domainDtos.PostShortDto;
import com.company.realestate.domains.posts.PostVideo;
import com.company.realestate.services.AliasService;
import com.company.realestate.utils.CustomSessionLocaleResolver;
import org.modelmapper.Converter;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.spi.MappingContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Configuration
public class ModelMapperDtoConfig {

    @Autowired
    CustomSessionLocaleResolver localeResolver;

    @Autowired
    AliasService aliasService;

    @Bean
    public ModelMapper modelMapper() {

        ModelMapper modelMapper = new ModelMapper();

//        PropertyMap<User, UserDto> userMap = new PropertyMap<User, UserDto>() {
//            @Override
//            protected void configure() {
//                map().setPosts(source.getPosts()
//                        .stream()
//                        .map(post -> modelMapper.map(post, PostShortDto.class))
//                        .collect(Collectors.toList()));
//            }
//        };

        Converter<LocalDate, String> localDateConverter = new Converter<LocalDate, String>() {
            public String convert(MappingContext<LocalDate, String> context) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy", Locale.ENGLISH);
                return context.getSource() == null ? null : context.getSource().format(formatter);
            }
        };

        Converter<PostImage, String> postImageStringConverter = new Converter<PostImage, String>() {
            public String convert(MappingContext<PostImage, String> context) {
                return context.getSource() == null ? null : context.getSource().getImage();
            }
        };

        Converter<PostVideo, String> postVideoStringConverter = new Converter<PostVideo, String>() {
            public String convert(MappingContext<PostVideo, String> context) {
                return context.getSource() == null ? null : context.getSource().getVideo();
            }
        };

        Converter<RealEstateType, String> realEstateTypeStringConverter = new Converter<RealEstateType, String>() {
            public String convert(MappingContext<RealEstateType, String> context) {
                return context.getSource() == null ? null : aliasService.getAlias(
                        context.getSource().name(),
                        localeResolver.getLastRequestLocale());
            }
        };

//        PropertyMap<Post, PostShortDto> postShortMap = new PropertyMap<Post, PostShortDto>() {
//            @Override
//            protected void configure() {
//                map().setRealEstateType(aliasService.getAliase(source.getR);
//            }
//        };

        PropertyMap<Post, PostShortDto> postShortMap = new PropertyMap<Post, PostShortDto>() {
            @Override
            protected void configure() {
//                map().setRealEstateType(
//                        aliasService.getAlias(source.getRealEstateType().name(),
//                        localeResolver.getLastRequestLocale()));
            }
        };

        modelMapper.addConverter(localDateConverter);
        modelMapper.addConverter(postImageStringConverter);
        modelMapper.addConverter(postVideoStringConverter);
        modelMapper.addConverter(realEstateTypeStringConverter);
//        modelMapper.addConverter(aliasDtoConverter);
        modelMapper.addMappings(postShortMap);
//        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
        return modelMapper;
    }
}
