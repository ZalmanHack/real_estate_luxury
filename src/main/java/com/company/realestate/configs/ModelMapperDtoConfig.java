package com.company.realestate.configs;

import com.company.realestate.domains.localizations.Alias;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.dtos.AliasDto;
import com.company.realestate.dtos.PostShortDto;
import org.modelmapper.Converter;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.convention.MatchingStrategies;
import org.modelmapper.spi.MappingContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Configuration
public class ModelMapperDtoConfig {

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




        PropertyMap<Post, PostShortDto> postShortMap = new PropertyMap<Post, PostShortDto>() {
            @Override
            protected void configure() {
                map().setLatitude(source.getLocation().getLatitude());
            }
        };



        modelMapper.addConverter(localDateConverter);
        modelMapper.addConverter(postImageStringConverter);
//        modelMapper.addConverter(aliasDtoConverter);

        modelMapper.addMappings(postShortMap);

//        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);

        return modelMapper;
    }
}
